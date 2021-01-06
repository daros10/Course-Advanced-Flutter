const { io } = require('../index');
// Mensajes de Socket
io.on('connection', client => {

	console.log('Cliente Conectado');
	
  client.on('disconnect', () => { 
		console.log('Cliene Desconectado');
	 });

	 client.on('mensaje', (payload) => {
		 console.log('Mensaje:', payload);

		 io.emit('mensaje', { admin: "Nuevo mensaje" });
		 
	 })
});
