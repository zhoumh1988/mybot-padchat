const request = require('request')
const {err} = require('./Log')

const option = {
    url: 'http://openapi.tuling123.com/openapi/api/v2',
    method: "POST",
    json: true
}
const userInfo = {
    apiKey: '507874292e17473da89ef3b46d00cf31',
    userId: 'a879f15d23a9b5f0'
}
const Robot = (content, cb) => {
    option.body = {
        reqType: 0,
        perception: {
            "inputText": {
                "text": content
            }
        },
        userInfo: userInfo
    }
    request(option, (error, response, body) => {
        try{
            let res = eval(body);
            cb(res.results[0].values.text);
        } catch(e) {
            err.error(e);
            cb('稍等下，我貌似断片了～');
        }
    });
}

module.exports = Robot;