const {Client} = require('pg');
const {configs} = require('../configs');
const User = require('./User')
const Product = require('./Product')

const client = new Client(configs);

// Фаршеруем модель клиентом и названием таблици

User._client = client;
User._tableName = 'users'

Product._client = client;
Product._tableName = 'products';

module.exports = {
    client,
    User, // абсолютно готовая к работе модель
    Product // абсолютно готовая к работе модель
}

/* 

Какие действия будут происходить в models/index.js (индексе моделей)?

+ 1. Настраиваем конфиг подключения к БД
+ 2. Подключение каждой нашей модели к БД

*/