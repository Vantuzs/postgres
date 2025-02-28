module.exports.mapUsers = (usersArray) => usersArray.map(({name:{first,last},gender,email,})=>`('${first}','${last}','${email}',${Boolean(Math.random() > 0.5)},'${gender}')`).join(',')


/* 

`INSERT INTO users_2 (first_name, last_name, email, is_subscribe,gender) VALUES
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}'),
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}'),
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}')`


*/