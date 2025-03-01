const { mapUsers } = require('../utils')

class User{
    // конфигурация pg для подключения до БД, мы будем передавать клиент с наружи при созданиии класу модели User
    static _client;
    // имя таблици с который мы работаем
    static _tableName;

    static async findAll(){
        return await this._client.query(`SELECT * FROM ${this._tableName}`)
    }
    
    static async bulkCreate(usersArray){
        // тут должен быть запрос к БД на создание многих юзеров
        return await this._client.query( // User._client.query
            `INSERT INTO ${this._tableName} (first_name, last_name, email, is_subscribe,gender) VALUES
            ${mapUsers(usersArray)};`
        );
    }
}

module.exports = User;