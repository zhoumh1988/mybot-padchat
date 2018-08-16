const fs = require('fs')
const path = require('path')
const moment = require('moment')
const Log = require('log')
const logFile = fs.createWriteStream(path.resolve(__dirname, '../logs/' + moment().format('YYYY-MM-DD') + '.log'));
const info = new Log('info', logFile)
const err = new Log('error', logFile)
module.exports = {
    info,
    err
};