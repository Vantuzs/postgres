module.exports.mapUsers = (usersArray) => usersArray.map((currentUser)=>`('${currentUser.firstName}','${currentUser.lastName}','${currentUser.email}',${currentUser.isSubscribe},'${currentUser.gender}')`).join(',')


/* 

`INSERT INTO users_2 (first_name, last_name, email, is_subscribe,gender) VALUES
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}'),
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}'),
('${user.firstName}','${user.lastName}','${user.email}',${user.isSubscribe},'${user.gender}')`


*/