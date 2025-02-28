const {Client} = require('pg');

const configs = {
    host: 'localhost',
    port: '5432',
    user: 'postgres',
    password: 'postgres1478',
    database: 'students'
}

const client = new Client(configs);

async function runRequest() {
    await client.connect();
    const response = await client.query(
        `INSERT INTO users(first_name, last_name, email, is_subscribe,gender,id) VALUES
        ('Iron','Man','ironMan@gmail.com',true,'male',25)`
    );
    console.log(response);
    await client.end();
}

runRequest();