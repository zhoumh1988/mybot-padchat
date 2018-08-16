const request = require('request');
const Jok = (cb) => {
    let page = parseInt(Math.random() * 1000)
    request.get(
        `http://v.juhe.cn/joke/content/list.php?key=b230e32d98083bbfc88787ee9c6b9018&page=${page}&pagesize=1&time=${parseInt(new Date() / 1000)}`,
         (error, response, body) => {
            let res = JSON.parse(body);
            if(res.reason == 'Success') {
                cb(res.result.data[0].content);
            }
         });
}
module.exports = Jok