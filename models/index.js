const {Client} = require('pg');
const {configs} = require('../configs');
const User = require('./User')

const client = new Client(configs);

User._client = client;
User._tableName = 'users_2'

module.exports = {
    client,
    User // абсолютно готовая к работе модель
}

/* 

Какие действия будут происходить в models/index.js (индексе моделей)?

+ 1. Настраиваем конфиг подключения к БД
+ 2. Подключение каждой нашей модели к БД

*/