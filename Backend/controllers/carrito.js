const Carrito = require('../models/carrito');
const CarritoProducto = require('../models/carrito_productos');
const Producto = require('../models/producto');


exports.addProductoAlCarrito = async (req, res) => {
  const { id_usuario, id_producto, cantidad } = req.body;

  try {
    
    const carrito = await Carrito.findOne({ where: { id_usuario } });
    if (!carrito) {
      return res.status(404).json({ error: 'El carrito no existe' });
    }

 
    const existingProducto = await CarritoProducto.findOne({
      where: { id_carrito: carrito.id, id_producto },
    });

    const producto = await Producto.findByPk(id_producto);

    if (!producto) {
      return res.status(404).json({ error: 'El producto no existe' });
    }

  
    if (existingProducto) {
      existingProducto.cantidad += cantidad;

    
      if (existingProducto.cantidad > producto.stock) {
        return res.status(400).json({ error: 'No puedes agregar más productos de los disponibles en el stock' });
      }

      await existingProducto.save();
    } else {
     
      if (producto.stock === 1) {
       
        const updatedExistingProducto = await CarritoProducto.findOne({
          where: { id_carrito: carrito.id, id_producto },
        });

        if (updatedExistingProducto) {
          return res.status(400).json({ error: 'No puedes agregar más de un producto al carrito, el stock es igual a 1' });
        }
      }

      if (cantidad <= producto.stock) {
        await CarritoProducto.create({ id_carrito: carrito.id, id_producto, cantidad });
      } else {
        return res.status(400).json({ error: 'No puedes agregar más productos de los disponibles en el stock' });
      }
    }

    
    carrito.cantidad += cantidad;
    await carrito.save();

    // Configurar los encabezados CORS
    res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
    res.header('Access-Control-Allow-Credentials', 'true');

    res.json({ message: 'Producto añadido al carrito con éxito' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al agregar el producto al carrito' });
  }
};




exports.modificarCantidadEnCarrito = async (req, res) => {
  const { id_usuario, id_producto, cantidad } = req.body;

  try {
  
    const carrito = await Carrito.findOne({ where: { id_usuario } });

    if (!carrito) {
      return res.status(404).json({ error: 'El carrito no existe' });
    }

 
    const carritoProducto = await CarritoProducto.findOne({
      where: { id_carrito: carrito.id, id_producto },
    });

    if (!carritoProducto) {
      return res.status(404).json({ error: 'El producto no existe en el carrito' });
    }

 
    const producto = await Producto.findByPk(id_producto);

    if (!producto) {
      return res.status(404).json({ error: 'El producto no existe' });
    }


    if (cantidad > producto.stock) {
      return res.status(400).json({ error: 'No puedes agregar más productos de los disponibles en el stock' });
    }

   
    carrito.cantidad = cantidad;
    await carrito.save();

  
    carritoProducto.cantidad = cantidad;
    await carritoProducto.save();


    res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
    res.header('Access-Control-Allow-Credentials', 'true');

    res.json({ message: 'Cantidad modificada con éxito' });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al modificar la cantidad' });
  }
};


exports.getCarrito = async (req, res) => {
  const { id_usuario } = req.params; 

  try {
    const carrito = await Carrito.findOne({ where: { id_usuario } });

    if (!carrito) {
      return res.status(404).json({ error: 'El carrito no existe' });
    }

    const carritoProductos = await CarritoProducto.findAll({
      where: { id_carrito: carrito.id },
      include: {
        model: Producto,
        attributes: {
          exclude: ['descripcion'],
        },
      },
      attributes: {
        exclude: ['id_usuario'],
      },
    });

    if (!carritoProductos || carritoProductos.length === 0) {
      return res.status(404).json({ error: 'El carrito no existe o está vacío' });
    }

   
    const precioTotal = carritoProductos.reduce((total, item) => {
      return total + item.producto.precio * item.cantidad;
    }, 0);

    const formattedCarritoProductos = carritoProductos.map(item => ({
      producto: {
        id: item.producto.id,
        nombre: item.producto.nombre,
        precio: item.producto.precio,
      },
      cantidad: item.cantidad,
    }));

 
    res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
    res.header('Access-Control-Allow-Credentials', 'true');

    res.json({ carritoId: carrito.id, carritoProductos: formattedCarritoProductos, precioTotal });
  } catch (error) {
    console.error(error);
    res.status(500).json({ error: 'Error al obtener el carrito' });
  }
};




exports.vaciarCarrito = async (req, res) => {
  const { id_usuario } = req.params;

  try {
  
    const carrito = await Carrito.findOne({ where: { id_usuario } });

    if (!carrito) {
      return res.status(404).json({ error: 'El carrito no existe' });
    }

 
    carrito.cantidad = 0; 
    await carrito.save();

   
      await CarritoProducto.destroy({ where: { id_carrito: carrito.id }});

     
      res.header('Access-Control-Allow-Origin', 'http://localhost:4200');
      res.header('Access-Control-Allow-Credentials', 'true');
  
      res.json({ message: 'Carrito vaciado con éxito' });
    } catch (error) {
      console.error(error);
      res.status(500).json({ error: 'Error al vaciar el carrito' });
    }
  };