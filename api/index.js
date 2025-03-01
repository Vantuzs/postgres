module.exports.getUsers = async()=>{
    const response = await fetch('https://randomuser.me/api?results=10&seed=ONL-JS-PFE2023-2&page=5');
    const data = await response.json();
    return data.results;
}