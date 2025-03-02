const _ = require('lodash')

class Order{
    static _client;
    static _tableNames;
    
    static async bulkCreate(usersArray,productsArray) {
        // 1. Создаем новые заказы
        // для 2 го действия, возвращаем с запроса ИД-шники созданных заказов
        const ordersValuesString =usersArray.map(currentUser =>
            // вот этот масив - все заказы поточного просматриваемого юзера в масиве
            // фактично мы делаем рандомное количество заказов для каждого пользователя
            new Array(_.random(1,3,false)) // генерируем от 1 до 3х заказов для ползователя
            .fill(null)
            .map(()=> `(${currentUser.id})`)
            .join(',')
        ).join(',') 

        const { rows: orders } = await this._client.query(
            `INSERT INTO ${this._tableNames[0]} (customer_id) VALUES ${ordersValuesString} RETURNING id;` 
        );
        console.log(orders);

        // 2. нагенерироваеть позиций в каждый заказ
        const productsToOrdersValueString = orders.map(currentOrder => {
            const positionsArray = new Array(_.random(1,4,false)) // для каждого заказа генерирум от 1 до 4х позиций в чеке
            .fill(null)
            .map(()=> productsArray[_.random(0,productsArray.length-1,false)]) // радномна выбераем какойта тавар с таблици таварав

            return [...new Set(positionsArray)]
            .map(currentProduct => `(${currentOrder.id},${currentProduct.id},${_.random(1,3,false)})`) // рандамна выбераем количество товара
            .join(',');
        }).join(',')


        return await this._client.query(
            `INSERT INTO ${this._tableNames[1]} (order_id,products_id,quantity)
            VALUES ${productsToOrdersValueString};`
        )
    }
}

module.exports = Order