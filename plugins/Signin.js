const Query = require('../service/Query');
const async = require('async');
const {info} = require('./Log')

class Signin {
    constructor(room, sender) {
        this.room = room;
        this.sender = sender;
    }

    done(cb) {
        let rk = this.room.id;
        let sk = this.sender.id;

        let task1 = function(callback) {
            Query.querySenderSignRankToday(rk, sk, res => {
                if(res.length != 0) {
                    callback(null, `今日签到排名第${res[0].rank + 1}`);
                }
            });
        }

        let task2 = function(callback) {
            Query.countSenderSigninTimes(rk, sk, res => {
                if(res.length != 0) {
                    callback(null, `本群已签到${res[0].times}次`);
                }
            });
        }

        Query.isSigned(rk, sk, res => {
            if(res.length != 0) {
                if(res[0].count != 0) {
                    cb('已签到');
                } else {
                    Query.roomSignin(rk, sk, _res => {
                        info.info(`用户${sk}，${rk}群签到`);
                        async.series([task1, task2], function(err, result) {
                            let reply = [];
                            reply.push('签到成功');
                            result.forEach(it => {
                                reply.push(it);
                            });
                            cb(reply.join('\n'));
                        });
                    });
                }
            }
        });
    }
}
module.exports = Signin