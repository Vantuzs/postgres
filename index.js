
const {User,Product,client} =require('./models')
const {getUsers} = require('./api');
const {generatePhones} =require('./utils')


async function runRequest() {
    await client.connect();

    const usersArray = await getUsers()

    // Генератор юзеров
    // const response = await User.bulkCreate(usersArray);
    // console.log(response);


    // Генератор товаров
    const phonesArray = generatePhones(400);
    const response = await Product.bulkCreate(phonesArray);
    
    console.log(response);

    await client.end();
}

runRequest();
// getUsers();