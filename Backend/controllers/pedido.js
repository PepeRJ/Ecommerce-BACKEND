const Pedido = require('../models/pedido');
const Carrito = require('../models/carrito');
const Usuario = require('../models/usuario');
const Producto = require('../models/producto');
const CarritoProducto = require('../models/carrito_productos');
const { Sequelize } = require('sequelize');




exports.crearPedido = async (req, res) => {
  console.log('Recibida solicitud POST en /pedido');
  const { id_usuario, id_carrito } = req.body;

  try {
    console.log('ID de usuario y carrito:', id_usuario, id_carrito);

    const usuario = await Usuario.findByPk(id_usuario);
    const carrito = await Carrito.findByPk(id_carrito);

    console.log('Usuario encontrado:', usuario);
    console.log('Carrito encontrado:', carrito);

    if (!usuario || !carrito) {
      console.error('Usuario o carrito no encontrado');
      return res.status(404).json({ error: 'Usuario o carrito no encontrado' });
    }

    const productosEnCarrito = await CarritoProducto.findAll({
      where: { id_carrito: carrito.id },
      include: Producto,
    });

    console.log('Productos en el carrito:', productosEnCarrito);

    let precio_total_en_euros = 0;

    for (const productoEnCarrito of productosEnCarrito) {
    
      if (
        productoEnCarrito.producto &&
        productoEnCarrito.producto.precio !== null &&
        productoEnCarrito.producto.precio !== undefined
      ) {
        precio_total_en_euros += productoEnCarrito.producto.precio * productoEnCarrito.cantidad;

 
        const cantidadVendida = productoEnCarrito.cantidad;
        await Producto.update(
          { stock: Sequelize.literal(`stock - ${cantidadVendida}`) },
          { where: { id: productoEnCarrito.producto.id } }
        );
      } else {
        console.log("Producto sin precio válido:", productoEnCarrito.producto);
      }
    }


    const cantidadAComprar = productosEnCarrito.reduce((total, producto) => total + producto.cantidad, 0);
    if (cantidadAComprar > usuario.stock) {
      return res.status(400).json({ error: 'No puedes comprar más productos de los disponibles en el stock' });
    }

  
    const fechaActual = new Date();
    console.log('Fecha actual:', fechaActual);

    const pedido = await Pedido.create({
      id_usuario,
      id_carrito,
      fecha: fechaActual,
      estado: 'en camino',
      precio_total: precio_total_en_euros,
      productos: productosEnCarrito.map(producto => ({
        nombre: producto.producto.nombre,
        cantidad: producto.cantidad,
        precio: producto.producto.precio, 
      })),
    });


    pedido.productos.forEach(producto => {
      producto.precio = `${producto.precio}€`;
    });

    res.status(200).json({ success: true, pedido });
  } catch (error) {
    console.error('Error al crear el pedido:', error);
    res.status(500).json({ error: 'Error interno del servidor' });
  }
};


exports.actualizarPedido = async (req, res) => {
    const { id_pedido } = req.params;
    const { estado } = req.body;
  
    try {
      const pedido = await Pedido.findByPk(id_pedido);
  
      if (!pedido) {
        return res.status(404).json({ error: 'Pedido no encontrado' });
      }
  

      pedido.estado = estado;
      await pedido.save();
  
      res.json({ message: 'Estado del pedido actualizado con éxito' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Error al actualizar el pedido' });
    }
  };

  exports.eliminarPedido = async (req, res) => {
    const { id_pedido } = req.params;
  
    try {
      const pedido = await Pedido.findByPk(id_pedido);
  
      if (!pedido) {
        return res.status(404).json({ error: 'Pedido no encontrado' });
      }
  
 
      await pedido.destroy();
  
      res.json({ message: 'Pedido eliminado con éxito' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Error al eliminar el pedido' });
    }
  };



  exports.obtenerPedidosUsuario = async (req, res) => {
    const { id_usuario } = req.params;
  
    try {
      const pedidosUsuario = await Pedido.findAll({
        where: { id_usuario },
      });
  
      if (pedidosUsuario.length > 0) {
        res.json(pedidosUsuario);
      } else {
        res.status(404).json({ message: 'No se encontraron pedidos para este usuario' });
      }
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Error al obtener los pedidos del usuario' });
    }
  };
