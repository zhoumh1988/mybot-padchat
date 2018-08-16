const fs = require('fs')
const path = require('path')
const pool = require('./DB')
const moment = require('moment')
const Log = require('log')
const log = new Log('error', fs.createWriteStream(path.resolve(__dirname, '../logs/Query_' + moment().format('YYYY-MM-DD') + '.log')))

/**
 * 连接池拿连接查询
 * @param {String} sql 执行的sql语句
 * @param {Function} cb 回调函数
 */
const _pool_connection = (sql, cb) => {
    pool.getConnection((err, connection) => {
        if(!!err) log.error(`${sql}\n${err}`);
        connection.query(sql, async function (error, res, fields) {
            typeof cb == 'function' && cb(res);
            if(error) log.error(`${sql}\n${error}`);
            connection.release();
        });
    });
}
/** 查询群名称 */
const queryRooms = (userId, cb) => {
    _pool_connection(`SELECT id, topic FROM room WHERE user_id = '${userId}'`, cb);
}
/** 查询关键字 */
const queryKeywords = (keywords, cb) => {
    _pool_connection(`SELECT * FROM keywords WHERE keyword="${keywords}"`, cb);
}

/**
 * 
 * @param {String} rk 群id
 * @param {String} sk 发送用户id
 * @param {Function} cb 回调函数
 */
const querySenderSignRankToday = (rk, sk, cb) => {
    _pool_connection(`SELECT COUNT(1) AS rank FROM room_sign WHERE room_key = "${rk}" AND DATE_FORMAT(created,'%Y-%m-%d')='${moment().format('YYYY-MM-DD')}' AND created < ( SELECT b.created FROM room_sign b WHERE b.room_key = "${rk}" AND b.user_key = "${sk}" AND DATE_FORMAT( b.created, '%Y-%m-%d' ) = '${moment().format('YYYY-MM-DD')}')`, cb);
}

/**
 * 
 * @param {String} rk 群id
 * @param {String} sk 发送用户id
 * @param {Function} cb 回调函数
 */
const countSenderSigninTimes = (rk, sk, cb) => {
    _pool_connection(`SELECT count(1) AS times  FROM room_sign WHERE user_key="${sk}" AND room_key="${rk}"`, cb);
}

/**
 * 
 * @param {String} rk 群id
 * @param {String} sk 发送用户id
 * @param {Function} cb 回调函数
 */
/** 已签到 */
const isSigned = (rk, sk, cb) => {
    _pool_connection(`SELECT COUNT(1) AS count FROM room_sign WHERE user_key="${sk}" AND room_key="${rk}" AND DATE_FORMAT(created,'%Y-%m-%d') = "${moment().format('YYYY-MM-DD')}";`, cb);
}

/**
 * 
 * @param {String} rk 群id
 * @param {String} sk 发送用户id
 * @param {Function} cb 回调函数
 */
const roomSignin = (rk, sk, cb) => {
    _pool_connection(`INSERT INTO room_sign (room_key, user_key) VALUES ("${rk}","${sk}")`, cb);
}

/**
 * 更新群名称
 * @param {String} oldTopic 修改前
 * @param {String} topic 修改后
 */
const updateRoom = (oldTopic, topic, cb) => {
    _pool_connection(`UPDATE room SET topic = "${topic}" WHERE topic = "${oldTopic}"`, cb);
}

const insertRoom = (topic, roomid, cb) => {
    _pool_connection(`INSERT INTO room (topic,roomid) VALUES ("${topic}", "${roomid}")`, cb);
}

const updateRoomByRoomid = (topic, roomid) => {
    _pool_connection(`UPDATE room SET topic = "${topic}" WHERE roomid = "${roomid}"`);
}

const getRoomByRoomid = (roomid, cb) => {
    _pool_connection(`SELECT * FROM room WHERE roomid="${roomid}"`, cb);
}

/**
 * 随机查找笑话
 * @param {Function} cb
 */
const queryJobRandom = (cb) => {
    _pool_connection(`SELECT content FROM jok ORDER BY RAND() LIMIT 1`, cb);
}

module.exports = {
    queryRooms,
    queryKeywords,
    
    // 签到
    querySenderSignRankToday,
    countSenderSigninTimes,
    isSigned,
    roomSignin,

    queryJobRandom,

    updateRoom,
    insertRoom,
    getRoomByRoomid,
    updateRoomByRoomid
}