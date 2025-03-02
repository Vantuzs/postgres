class Product {
    static _client;
    static _tableName;

    static async bulkCreate(phonesArray){
        // 1. Перетворить JS-обьекты телефонов в SQL-запрос (должны получить масив SQL values в INSERTе)
        const valuesString = phonesArray.map(({brand,model,price,quantity=1,category})=>
            `('${brand}','${model}','${price}','${quantity}','${category}')`)
        .join(',')

        // 2. Выполнить сам запрос и сохранить результат выполнения
        const {rows} = await this._client.query(
            `INSERT INTO ${this._tableName} (brand,model,price,quantity,category) VALUES
            ${valuesString} RETURNING *;`
        );


        // 3. Результат запроса вернуть как результат работы методу модели
        return rows;
    }

    static async findAll(){
        return await this._client.query(`SELECT * FROM ${this._tableName}`)
    }
}

module.exports = Product