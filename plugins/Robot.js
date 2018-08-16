const request = require('request')
const {err} = require('./Log')
const {ROBOT_APIKEY} = require('../config')

const option = {
    url: 'http://openapi.tuling123.com/openapi/api/v2',
    method: "POST",
    json: true
}

const Robot = (content, cb) => {
    option.body = {
        reqType: 0,
        perception: {
            "inputText": {
                "text": content
            }
        },
        userInfo: ROBOT_APIKEY
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