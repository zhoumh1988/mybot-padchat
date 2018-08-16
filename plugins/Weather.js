const request = require('request');
const {WEATHER_KEY} = require('../config');

const props = [];

class Weather {
    constructor(content, sender, cb) {
        let cityName;
        let bs = '天气';
        if(content.indexOf('预报') != -1) {
            bs = '天气预报';
        }
        if(sender.city() == null || sender.city().length == 0 || sender.province() == null || sender.province().length == 0) {
            cb('未加载到您的城市信息，请尝试输入\n天气：城市\n进行查询，例如\n天气：朝阳,北京');
        }
        if(content.startsWith('查询天气')) {
            if(content.indexOf(':') != -1 || content.indexOf('：') != -1) {
                cityName = content.split(content.indexOf(':') != -1 ? ':' : '：')[1];
            } else {
                cityName = `${sender.city().toLocaleLowerCase()},${sender.province().toLocaleLowerCase()}`;
            }
        } else {
            if(content.indexOf(':') != -1 || content.indexOf('：') != -1) {
                cityName = content.split(content.indexOf(':') != -1 ? ':' : '：')[1];
            } else if(content == bs) {
                cityName = `${sender.city().toLocaleLowerCase()},${sender.province().toLocaleLowerCase()}`;
            } else {
                cb('请输入 天气：城市 获取城市天气信息')
                return;
            }
        }
        this[bs == '天气预报' ? 'getWeatheForecastByCity' : 'getWeatherByCity'](cityName, msg => {
            msg += `\n\n您还可以输入\n天气：城市\n天气预报：城市\n查询外地天气`;
            cb(msg);
        });
    }

    _renderWeather(res = {}) {
        return `${res.update.loc}\n${res.now.cond_txt} ${res.now.fl}℃\n相对湿度${res.now.hum}%\n${res.now.wind_dir} ${res.now.wind_sc}级\n能见度${res.now.vis}公里`;
    };

    _renderCity(res = {}) {
        let str = '';
        if(res.basic.location == res.basic.parent_city) {
            if(res.basic.parent_city == res.basic.admin_area) {
                str = res.basic.admin_area;
            } else {
                str = `${res.basic.admin_area}_${res.basic.parent_city}`
            }
        } else {
            if(res.basic.admin_area == res.basic.parent_city) {
                str = `${res.basic.admin_area}_${res.basic.location}`
            } else {
                str = `${res.basic.admin_area}_${res.basic.parent_city}_${res.basic.location}`
            }
        }
        return str;
    };

    getWeatherByCity(cn, cb) {
        request.post(
            `https://free-api.heweather.com/s6/weather/now?${[
                `key=${WEATHER_KEY}`,
                `location=${encodeURIComponent(cn.toLocaleLowerCase())}`,
                'lang=zh-cn'
            ].join('&')}`,
             (error, response, body) => {
                if (!error && response.statusCode == 200) {
                    body = JSON.parse(body);
                    let msg = '';
                    if(!!body.HeWeather6[0] && body.HeWeather6[0].status == 'ok') {
                        let res = body.HeWeather6[0];
                        msg = [];
                        msg.push(this._renderCity(res));
                        msg.push(' 实时天气\n');
                        msg.push(this._renderWeather(res));
                        msg = msg.join('');
                    } else {
                        msg = `未查找到城市${cn}的天气信息`
                    }
                    cb(msg);
                }
            }
        );
    }

    _renderWeatherForecast(res = {}) {
        return `${res.daily_forecast.map(it => {
            return `${it.date}\n气温：${it.tmp_min}℃ ~ ${it.tmp_max}℃\n相对湿度${it.hum}%\n白天：${it.cond_txt_d}\n夜间：${it.cond_txt_n}\n${it.wind_dir} ${it.wind_sc}级\n能见度${it.vis}公里\n紫外线强度指数${it.uv_index}\n\n`;
        }).join('')}`;
    };

    getWeatheForecastByCity(cn, cb) {
        request.post(
            `https://free-api.heweather.com/s6/weather/forecast?${[
                `key=${WEATHER_KEY}`,
                `location=${encodeURIComponent(cn.toLocaleLowerCase())}`,
                'lang=zh-cn'
            ].join('&')}`,
            (error, response, body) => {
                if (!error && response.statusCode == 200) {
                    body = JSON.parse(body);
                    let msg = '';
                    if(!!body.HeWeather6[0] && body.HeWeather6[0].status == 'ok') {
                        let res = body.HeWeather6[0];
                        msg = [];
                        msg.push(this._renderCity(res));
                        msg.push('未来' + res.daily_forecast.length + '天气象信息\n');
                        msg.push(this._renderWeatherForecast(res));
                        msg = msg.join('');
                    } else {
                        msg = `未查找到城市${cn}的天气信息`
                    }
                    cb(msg);
                }
            }
        );
    };
}

module.exports = Weather;