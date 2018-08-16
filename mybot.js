const fs = require('fs')
const moment = require('moment')
const Log = require('log')
const log = new Log('info', fs.createWriteStream(__dirname + '/logs/' + moment().format('YYYY-MM-DD') + '.log'))
const {
    FileBox
} = require('file-box')
const path = require('path')
const {
    Wechaty,
    Room,
    Message,
    Contact
} = require('wechaty')

const Query = require('./service/Query');
const Keyword = require('./actions/Keyword');
const {
    Weather,
    Signin,
    Jok,
    Robot
} = require('./plugins/index');

const {
    parseString
} = require('xml2js');

/** 允许自动回复的群 */
let rooms = [];
let roomTopic = [];

const validateRoom = (topic) => {
    return roomTopic.indexOf(topic) != -1;
}

/** 缓存添加关键字动作 */
const actions = {};

const bot = Wechaty.instance()
bot.on('scan', (qrcode, status) => {
        require('qrcode-terminal').generate(qrcode, {
            small: true
        });
    })
    // 扫码登录
    .on('login', async user => {
        let msg = `${user} login at ${moment().format('YYYY-MM-DD hh:mm:ss')}`;
        console.log(msg)
        log.info(msg);
        Query.queryRooms(user.id, res => {
            if (res.length != 0) {
                rooms = rooms.concat(res);
                res.forEach(it => roomTopic.push(it.topic))
            }
        });
        // let list = await bot.Room.findAll(); console.log('遍历群组'); list.forEach(async
        // it => {     let topic = await it.topic();     Query.getRoomByRoomid(it.id,
        // async res => {         console.log(res);         if (res.length == 0) {
        // Query.insertRoom(topic, it.id, res => { console.log(`insert topic=${topic},
        // id=${it.id}`);             });         } else {
        // Query.updateRoomByRoomid(topic, it.id, res => {      console.log(`update
        // topic=${topic}, id=${it.id}`);             });   }     }); }) let contacts =
        // await bot.Contact.findAll(); console.log('遍历好友'); contacts.forEach(async it
        // => { console.log(`name=${it.name()}, id=${it.id}`); });
    }).on('logout', (user) => {
        let msg = `${user} logout at ${moment().format('YYYY-MM-DD hh:mm:ss')}`;
        console.log(msg)
        log.info(msg);
    })
    // 自动加好友
    .on('friendship', async function(contact, request) {
        if (request) {
            await request.accept()
            console.log(`Contact: ${contact.name()} send request ${request.hello}`)
        }
    })
    // 消息自动回复
    .on('message', async function(message) {
        if (message.self()) {
            return
        }
        const content = message.text()
        const sender = message.from()
        const room = message.room()

        if (content == '添加关键词') {
            let senderId = sender.id;
            actions[senderId] = new Keyword(message, end => {
                actions[senderId] = null;
            });
            actions[senderId].start();
            return;
        }
        if (!!actions[sender.id]) {
            actions[sender.id].next(content);
            return;
        }

        if (message.type() == Message.Type.Attachment) {
            if (content.indexOf('<title><![CDATA[微信红包]]></title>') != -1) {
                console.log('收到一个红包消息');
            }
            return;
        }

        if (message.type() !== Message.Type.Text) {
            log.info(`消息类型：${message.type()},content=${content}`);
            try {
                parseString(content, (err, res) => {
                    log.info(res);
                });
            } catch (e) {

            }
            return
        }

        let topic = room ?
            await room.topic() :
            null;
        // 校验群是否在自动回复组里
        if (room && !validateRoom(topic)) {
            return;
        }

        let speak = room || message;

        if (/今天天气怎么样/.test(content)) {
            await speak.say('正在帮你查询天气，请稍后');
            setTimeout(() => {
                new Weather('查询天气', sender, async msg => {
                    await speak.say(msg);
                });
            }, 1500);
            return;
        }

        /** 添加天气 */
        if (content.startsWith('查询天气') || content.startsWith('天气')) {
            new Weather(content, sender, async msg => {
                await speak.say(msg);
            });
            return;
        }

        if (room) {
            if (content == '签到') {
                let _room = rooms[roomTopic.indexOf(topic)];
                new Signin(_room, sender).done(async reply => {
                    await speak.say(reply);
                });
                return;
            }
            if (/out/.test(content) && room.id == '11464033773@chatroom') {
                await room.say("Remove from the room", sender);
                await room.del(sender);
                return;
            }
        } else {
            if (/room/.test(content)) {
                const keyroom = await bot.Room.find({topic: 'test'})
                if (keyroom) {
                    await keyroom.add(sender);
                    await keyroom.say("欢迎！", sender);
                }
                return;
            }
        }
        if (/笑话/.test(content)) {
            Jok(async(msg) => {
                await speak.say(msg);
            });
            // Query.queryJobRandom(async res => {
            //     try {
            //         if (res.length != 0) {
            //             res = res[0];
            //             await speak.say(res.content);
            //         }
            //     } catch (e) {
            //         log.error(e);
            //     }
            // });
            return;
        }
        Robot(content, async msg => {
            await speak.say(msg);
        });
        // 关键字回复
        // Query.queryKeywords(content, async res => {
        //     try {
        //         if (res.length != 0) {
        //             res = res[0];
        //             if (res.mime_type == 1) {
        //                 speak.say(res.content);
        //             } else if (res.mime_type > 1) {
        //                 let FILE_PATH = path.resolve(__dirname, res.content);
        //                 const fileBox = FileBox.fromStream(fs.createReadStream(FILE_PATH), FILE_PATH);
        //                 await speak.say(fileBox);
        //             }
        //         }
        //     } catch (e) {
        //         log.error(e);
        //     }
        // });
    })
    .on('room-topic', (room, topic, oldTopic, changer) => {
        Query.updateRoom(oldTopic, topic, res => {
            rooms[roomTopic.indexOf(oldTopic)].topic = topic;
        });
    })
    .on('room-join', (room, inviteeList, inviter) => {
        const nameList = inviteeList.map(c => c.name()).join(',');
        console.log(`Room ${room.topic()} got new member ${nameList}, invited by ${inviter}`);
    })
    .on('room-leave', (room, leaverList, remover) => {
        const nameList = leaverList.map(c => c.name()).join(',')
        console.log(`Room ${room.topic()} lost member ${nameList}${remover != null ? `, removed by ${remover}` : ''}`);
    })
    .on('heartbeat', async res => {
        console.log(res instanceof Contact);
        console.log('============heartbeat===========');
    })
    .on('error', e => log.info('Bot', 'error: %s', e));

bot.start();