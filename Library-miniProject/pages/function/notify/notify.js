// pages/notify/notify.js
import {
    store
} from '../../../store/store'
import api from '../../../utils/api'

Page({

    /**
     * 页面的初始数据
     */
    data: {
        createMessageVisible: false,
        createForm: {
            title: '',
            context: '',
            schoolId: '',
            date: '',
            userId: '',
        },
        index: 0,
        notifyTexts: []
    },


    // 处理点击事件，跳转notifyItem 并带上id
    notifyItemHandel(e) {
        wx.navigateTo({
            url: './notifyItem/notifyItem?id=' + this.data.notifyTexts[e.currentTarget.dataset.index].notificationId
        })
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
        if (!title || !context) {
            wx.showToast({
                title: '标题和内容不能为空',
                icon: 'none'
            });
            return;
        }

        // 组装要发送的数据
        const notificationData = {
            schoolId: schoolId || store.school.schoolId, // 假设schoolId可以从全局状态管理获取
            userId: userId || 'c97ec857-8489-4b72-9d34-ba1247d02b55', // 假设userId已设定或从某处获取
            title,
            context,
            date: date || null // 如果date字段应该为当前日期，可以用 new Date().toISOString()
        };

        // 调用API发送数据
        api.insertNotification(notificationData).then(() => {
            wx.showToast({
                title: '信息发送成功',
                icon: 'success'
            });
            this.closeCreateMessage();
        }).catch(error => {
            wx.showToast({
                title: '发送失败',
                icon: 'none'
            });
            console.error('Failed to send message:', error);
        });
    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {

    },

    /**
     * 生命周期函数--监听页面初次渲染完成
     */
    onReady() {

    },

    /**
     * 生命周期函数--监听页面显示
     */
    onShow() {
        setTimeout(() => this.getNotifications(), 50)

    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh() {
        this.getNotifications();

    },

    // 获取通知
    getNotifications() {
        let that = this
        if (!store.hasSchool || !store.hasSchool) return;
        let form = {
            schoolId: store.school.schoolId,
            page: 0,
            size: 10
        }
        api.queryNotifications(form).then(data => {
            console.log(data);
            if (data.data.content.length == 0) return;
            data.data.content.forEach(el => {
                el.time = new Date(el.date).toLocaleString().slice(0, 9);
            })
            that.setData({
                notifyTexts: data.data.content
            })
        })
    },
})