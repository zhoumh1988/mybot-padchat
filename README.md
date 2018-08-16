#微信机器人ipad版本

关键词回复，回复内容支持：

1. 文本
2. 图片
3. 音频
4. 视频

第三方扩展

1. 天气查询
2. 随机笑话
3. 群签到

##环境安装

> node服务

```ssh
服务是使用pm2启动的，因此需要安装全局pm2
npm install pm2 -g

npm i
```

> 数据库
>  > mysql8.0 数据库文件wechaty.sql
> 
> 	> 数据库名称，账户和密码见config.js文件
> 

## 修改配置文件
- mybot.json 
    - 修改 **{your-token}** 替换成你自己的token，没有的请到wechaty官网[申请](https://github.com/Chatie/wechaty/issues/1296)。
    - 修改 ```"WECHATY_LOG": "info",``` 日志级别，正式环境建议设置为info，开发环境建议设置为silly，日志级别：'silent' | 'error' | 'warn' | 'info' | 'verbose' | 'silly'。
- package.json 修改 **{your-token}** 替换成你自己的token。

##服务启动
```ssh
node服务调试
npm run nodeserver

or

pm2服务调试
npm start
```

##wechaty第三方框架依赖

[GitHub](https://github.com/chatie/wechaty)

[DOC](https://botorange.github.io/wechaty-doc/#/)

[Blog](https://blog.chatie.io/)


