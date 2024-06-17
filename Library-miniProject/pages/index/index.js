// index.js
import api from '../../utils/api'
// 引入ecahrt.js
import * as echarts from '../../ec-canvas/echarts';
import {
    store
} from '../../store/store'

// 获取应用实例
const app = getApp()

let chart = null


function initChart(canvas, width, height, dpr) {
    //获取像素比
    const getPixelRatio = () => {
        let pixelRatio = 0
        wx.getSystemInfo({
            success: function (res) {
                pixelRatio = res.pixelRatio
            },
            fail: function () {
                pixelRatio = 0
            }
        })
        return pixelRatio
    }
    // console.log(pixelRatio)
    dpr = getPixelRatio()

    chart = echarts.init(canvas, null, {
        width: width,
        height: height,
        devicPixelRatio: dpr
    });
    canvas.setChart(chart)
    let option = getOption() // 这里是echarts的配置信息
    chart.setOption(option)
}

function getOption() {
    return {
        title: {
            text: '',
            // subtext: "图书馆使用情况",
            left: 'center'
        },
        legend: {
            top: '1%'
        },
        series: [{
            name: 'Nightingale Chart',
            type: 'pie',
            radius: [0, 115],
            center: ['50%', '50%'],
            roseType: 'area',
            itemStyle: {
                borderRadius: 4
            },
            label: {
                alignTo: 'edge',
                formatter: '{name|{b}}\n{time|{c} }',
                minMargin: 5,
                edgeDistance: 10,
                lineHeight: 15,
                rich: {
                    time: {
                        fontSize: 10,
                        color: '#999'
                    }
                }
            },
            data: [{
                value: 40,

            },
                {
                    value: 38,

                },
                {
                    value: 32,

                }
            ]
        }]
    };
}

Page({
    data: {
        ec: {
            onInit: initChart
        }

    },

    onLoad() {

    },
    onShow() {
    },
    onReady() {
    },
})