const _ = require('lodash')

module.exports.mapUsers = (usersArray) => usersArray.map(({name:{first,last},gender,email,})=>`('${first}','${last}','${email}',${Boolean(Math.random() > 0.5)},'${gender}')`).join(',')


/* 

`INSERT INTO users_2 (first_name, last_name, email, is_subscribe,gender) VALUES
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}'),
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}'),
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}')`


*/

const PHONEWS_BRANDS = [
    'Samsung',
    'Iphone',
    'Xiaomi',
    'Huawai',
    'Sony',
    'Nokia',
];

const generateOnePhones = modelNumber => ({ // обькт товара, который мы будем добовлять к таблце products
    brand: PHONEWS_BRANDS[_.random(0,PHONEWS_BRANDS.length-1,false)],
    model: `model ${modelNumber}`, 
    quantity: _.random(10,1500,false),
    price: _.random(200,10000,false,),
    category: 'phones'
});


// module.exports.generatePhones = (phonesCount=100) =>{
//     const phonesArray = [];
    
//     for(let i =0;i<phonesCount;i++){
//         phonesArray.push(generateOnePhones(i));    
//     }

//     return phonesArray
// }

module.exports.generatePhones = (phonesCount=100) => new Array(phonesCount).fill(null).map((currentElement,index)=>generateOnePhones(index));
