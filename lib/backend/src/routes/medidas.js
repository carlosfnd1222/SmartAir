const{Router} = require('express');
const router = Router();
const cnx = require('../cnx.js');
const sql = require('mssql');

//Rutas para obtener informacion de la tabla medidas
router.get('/api/getMedidas/1', async (req, res) =>{
    let pool = await sql.connect(cnx);
    let salida = await pool.request().query('select e.NOM_ESTACION, s.NOM_SENSOR, m.VALOR_MEDIDA, m.FECHA from ESTACION as e INNER JOIN SENSOR as s ON e.ID_ESTACION = s.ID_ESTACION INNER JOIN MEDIDA AS m ON m.ID_SENSOR = s.ID_SENSOR where e.NOM_ESTACION=\'CICATA\';');
    res.json(salida.recordsets);
});

router.get('/api/getMedidas/2', async (req, res) =>{
    let pool = await sql.connect(cnx);
    let salida = await pool.request().query('select e.NOM_ESTACION, s.NOM_SENSOR, m.VALOR_MEDIDA, m.FECHA from ESTACION as e INNER JOIN SENSOR as s ON e.ID_ESTACION = s.ID_ESTACION INNER JOIN MEDIDA AS m ON m.ID_SENSOR = s.ID_SENSOR where e.NOM_ESTACION=\'REFUGIO\';');
    res.json(salida.recordsets);
});

router.get('/api/getMedidas/3', async (req, res) =>{
    let pool = await sql.connect(cnx);
    let salida = await pool.request().query('select e.NOM_ESTACION, s.NOM_SENSOR, m.VALOR_MEDIDA, m.FECHA from ESTACION as e INNER JOIN SENSOR as s ON e.ID_ESTACION = s.ID_ESTACION INNER JOIN MEDIDA AS m ON m.ID_SENSOR = s.ID_SENSOR where e.NOM_ESTACION=\'UTSJR\';');
    res.json(salida.recordsets);
});

router.get('/api/getMedidas/4', async (req, res) =>{
    let pool = await sql.connect(cnx);
    let salida = await pool.request().query('select e.NOM_ESTACION, s.NOM_SENSOR, m.VALOR_MEDIDA, m.FECHA from ESTACION as e INNER JOIN SENSOR as s ON e.ID_ESTACION = s.ID_ESTACION INNER JOIN MEDIDA AS m ON m.ID_SENSOR = s.ID_SENSOR where e.NOM_ESTACION=\'CENTRO\';');
    res.json(salida.recordsets);
});

router.get('/api/getMedidas/:fecha', async (req, res) =>{
    let pool = await sql.connect(cnx);
    let salida = await pool.request().query(`select e.ID_ESTACION, e.NOM_ESTACION, s.NOM_SENSOR, m.VALOR_MEDIDA, m.FECHA from ESTACION as e INNER JOIN SENSOR as s ON e.ID_ESTACION = s.ID_ESTACION INNER JOIN MEDIDA AS m ON m.ID_SENSOR = s.ID_SENSOR where m.FECHA like \'${req.params.fecha}%\ group by m.FECHA';`);
    res.json(salida.recordsets);
});


module.exports = router;
