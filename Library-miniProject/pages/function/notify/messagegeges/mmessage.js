// pages/notify/notify.js
import {store} from '../../../../store/store.js';
import api from '../../../../utils/api';

Page({
    data: {
        createForm: {
            title: '',
            context: '',
            schoolId: '',
            date: '',
            userId: '',
        },
        index: 0,
        notifyTexts: [],
        socketOpen: true,
        socketMsgQueue: [],
    },

    // 处理点击事件，跳转notifyItem 并带上id
    messageItemHandel(e) {
        wx.navigateTo({
            url: './notifyItem/notifyItem?id=' + this.data.notifyTexts[e.currentTarget.dataset.index].notificationId
        });
    },
    notifyItemHandel(e) {
        wx.navigateTo({
            url: '../notifyItem/notifyItem?id=' + this.data.notifyTexts[e.currentTarget.dataset.index].notificationId
        })
    },
    sendSocketMessageQueue() {
        while (this.data.socketMsgQueue.length > 0 && this.data.socketOpen) {
            const message = this.data.socketMsgQueue.shift();
            wx.sendSocketMessage({
                data: JSON.stringify(message),
                success: () => {
                    // getNotifications();
                    console.log('消息发送成功:', message);
                },
                fail: (error) => {
                    console.error('消息发送失败:', error);
                }
            });
        }
    },
    openCreateMessage() {
        this.setData({createMessageVisible: true});
    },
    closeCreateMessage() {
        this.setData({createMessageVisible: false});
    },
    inputTitle(e) {
        this.setData({'createForm.title': e.detail.value});
    },
    inputContent(e) {
        this.setData({'createForm.context': e.detail.value});
    },
    submitCreateMessage() {
        const {title, context, schoolId, userId, date} = this.data.createForm;

        // 检查标题和内容是否为空
        if (!context) {
            wx.showToast({
                title: '标题和内容不能为空',
                icon: 'none'
            });
            return;
        }
        // console.log("可能获取到userid"+notify.userId);
        // 组装要发送的数据
        const notificationData = {
            schoolId: schoolId || store.school.schoolId,

            userId: userId || store.userInfo.userId,
            title,
            context,
            date: date || null
        };

        // 发送消息到WebSocket服务器
        if (this.data.socketOpen) {
            const messageData = {
                type: 'message',
                content: notificationData
            };
            wx.sendSocketMessage({
                data: JSON.stringify(messageData),
                success: () => {
                    // 清空输入框
                    this.setData({
                        'createForm.title': '',
                        'createForm.context': ''
                    });
                    wx.showToast({
                        title: '信息发送成功',
                        icon: 'success'
                    });
                    this.closeCreateMessage();

                    // 发送成功后获取通知
                    // this.getNotifications();
                },
                fail: (error) => {
                    wx.showToast({
                        title: '发送失败',
                        icon: 'none'
                    });
                    console.error('Failed to send message:', error);
                }
            });
        } else {
            // WebSocket未连接，将消息加入队列
            this.data.socketMsgQueue.push(notificationData);
            wx.showToast({
                title: 'WebSocket连接未建立，请稍后再试',
                icon: 'none'
            });
        }
    },

    onLoad(options) {
        console.log("我有反应吗");
        wx.connectSocket({
            url: 'wss://9pmqa1828965.vicp.fun/chat',

            timeout: 5000,
        });

        wx.onSocketOpen(() => {
            console.log("WebSocket 连接已打开");
            this.setData({socketOpen: true});
            // 发送队列中的消息
            this.sendSocketMessageQueue();
        });

        wx.onSocketError((error) => {
            console.error('WebSocket 连接打开失败，请检查！', error);
        });

        wx.onSocketMessage((res) => {
            // this.getNotifications();
            console.log("有贼人喊话内容是" + res);
            // 收到新消息时处理
            const newMessage = JSON.parse(res.data);
            const notifyTexts = [newMessage, ...this.data.notifyTexts];
            this.setData({notifyTexts});
        });
    },

    onReady() {

    },

    onShow() {
        setTimeout(() => this.getNotifications(), 50);
    },

    onPullDownRefresh() {
        this.getNotifications();
    },

    getNotifications() {
        if (!store.hasSchool || !store.hasSchool) return;
        const form = {
            schoolId: store.school.schoolId,
            page: 0,
            size: 10,
        };
        api.queryMessageNotifications(form).then(data => {
            console.log(data);
            if (data.data.content.length == 0) return;
            data.data.content.forEach(el => {
                el.time = new Date(el.date).toLocaleString().slice(0, 9);
            });
            this.setData({
                notifyTexts: data.data.content
            });
        }).catch(error => {
            console.error('Failed to get notifications:', error);
        });
    },
});
