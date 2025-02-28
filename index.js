const {Client} = require('pg');
const {mapUsers} = require('./utils')
const configs = {
    host: 'localhost',
    port: '5432',
    user: 'postgres',
    password: 'postgres1478',
    database: 'students'
}

const client = new Client(configs);

const usersArray = [
    {
        firstName: 'Test1',
        lastName: 'Doe',
        email: 'doe1@gmail.com',
        isSubscribe: true,
        gender: 'male'
    },{
        firstName: 'Test2',
        lastName: 'Doe',
        email: 'do2@gmail.com',
        isSubscribe: true,
        gender: 'male'
    },{
        firstName: 'Test3',
        lastName: 'Doe',
        email: 'do3@gmail.com',
        isSubscribe: true,
        gender: 'male'
    }
]



const user = {
    firstName: 'John',
    lastName: 'Doe',
    email: 'doe@gmail.com',
    isSubscribe: true,
    gender: 'male'
}

async function runRequest() {
    await client.connect();
    const response = await client.query(
        `INSERT INTO users_2 (first_name, last_name, email, is_subscribe,gender) VALUES
        ${mapUsers(usersArray)}`
    );
    console.log(response);
    await client.end();
}

runRequest();