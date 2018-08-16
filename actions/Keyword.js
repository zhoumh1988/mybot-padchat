const Action = require('./Action');
const pool = require('../service/DB');

// 步骤
const _STEPS = [
    {content: 'STEP1：请输入关键词，点击发送', prop: 'keyword'},
    {content: 'STEP2：请输入类型，点击发送\r\n1-文本\r\n2-图片\r\n3-音频\r\n4-视频\r\n文件类型限制大小1MB', prop: 'mime_type'},
    {content: 'STEP3：请输入回复内容，点击发送', prop: 'content'},
    {content: 'STEP4：发送end结束添加'}
];

class Keyword extends Action {
    constructor(message, finished) {
        super(message, finished);
    }

    async start() {
        await this.message.say(_STEPS[this.STEP].content);
    }
    
    async next(content) {
        if(_STEPS[this.STEP].prop) {
            this[_STEPS[this.STEP].prop] = content;
        }
        this.STEP++;
        if(this.STEP < _STEPS.length) {
            await this.message.say(_STEPS[this.STEP].content)
        } else if(content == 'end') {
            pool.getConnection((error, connection) => {
                connection.query(`insert into keywords (keyword, mime_type, content) values ('${this.keyword}',${this.mime_type},'${this.content}')`, async  (err, res, fields) => {
                    await this.message.say(err ? '失败' : '成功');
                    connection.release();
                    if (error) throw error;
                });
            })
            typeof this.finished == 'function' && this.finished(true);
        }
    }
};

module.exports = Keyword;