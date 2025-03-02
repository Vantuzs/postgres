const {Client} = require('pg');
const {configs} = require('../configs');
const User = require('./User')
const Product = require('./Product')
const Order = require('./Order');

const client = new Client(configs);

// Фаршеруем модель клиентом и названием таблици

User._client = client;
User._tableName = 'users'

Product._client = client;
Product._tableName = 'products';

Order._client = client;
Order._tableNames = ['orders','orders_to_products']; // 0 - главная таблица, 1 - подчененная таблица


module.exports = {
    client,
    User, // абсолютно готовая к работе модель
    Product, // абсолютно готовая к работе модель
    Order
}

/* 

Какие действия будут происходить в models/index.js (индексе моделей)?

+ 1. Настраиваем конфиг подключения к БД
+ 2. Подключение каждой нашей модели к БД

*/