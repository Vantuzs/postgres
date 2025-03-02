module.exports.getUsers = async()=>{
    const response = await fetch('https://randomuser.me/api?results=500&seed=ONL&page=10');
    const data = await response.json();
    return data.results;
}