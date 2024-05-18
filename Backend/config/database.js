const { Sequelize } = require('sequelize');

const sequelize = new Sequelize('tienda', 'root', '', {
  host: 'localhost',
  dialect: 'mysql', 
  port: 3305,
});

console.log('Instancia de Sequelize:', sequelize); 
module.exports = sequelize;
