const cnx = require('./cnx.js');
const sql = require('mssql');

async function connect() {
    try {
        let pool = await sql.connect(cnx);
        console.log('Estado de la conexion: '+pool._connected);
        //let salida = await pool.request().query(`'select e.NOM_ESTACION, s.NOM_SENSOR, m.VALOR_MEDIDA 
        //from ESTACION as e INNER JOIN SENSOR as s ON e.ID_ESTACION = s.ID_ESTACION
        //INNER JOIN MEDIDA AS m ON m.ID_SENSOR = s.ID_SENSOR;'`);
        //console.log(salida.recordsets);
    } catch (err) {
        console.log(err);
    }
}
//connect();
module.exports = {connect}