const app = require('./app');
const {connect} = require('./database');

async function main() {
    //conexión con la BD
    await connect();

    //Servidor Express
    await app.listen(4000);
    console.log('Servidor en el puerto 4000')    
}

main();