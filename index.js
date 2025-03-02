
const {User,Product,Order,client} =require('./models')
const {getUsers} = require('./api');
const {generatePhones} =require('./utils')


async function runRequest() {
    await client.connect();

    
    // Генератор юзеров
    // const usersArray = await getUsers()
    // const response1 = await User.bulkCreate(usersArray);


    // // Генератор товаров
    // const phonesArray = generatePhones(400);
    // const response2= await Product.bulkCreate(phonesArray);


    // Генератор заказов
    // const { rows: usersArrayForOrders } = await User.findAll(); // все юзеры с таблици users
    // const {rows: productsArray} = await Product.findAll(); // все товары с таблици products
    // const response = await Order.bulkCreate(usersArrayForOrders,productsArray)

    
    // console.log(response);

    await client.end();
}

runRequest();
// getUsers();