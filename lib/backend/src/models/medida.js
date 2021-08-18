const {Schema, model} = require('mongoose');

const medidaSchema = new Schema({
    estacion: String,
    pm1: String,
    pm10: String,
    pm25: String,
    temperatura: String,
    humedad: String,
    co: String
});

model.exports = model('Medidas', medidaSchema);