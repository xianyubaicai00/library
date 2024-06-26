// pages/cquptLogin/cquptLogin.js
import {
    createStoreBindings
} from 'mobx-miniprogram-bindings'
import {
    store
} from '../../../store/store'

Page({

    /**
     * 页面的初始数据
     */
    data: {
        cqupt_id: "",
        password: "",

    },
    bindCquptId: function (e) {
        this.setData({
            cqupt_id: e.detail.value
        })
    },
    bindPassword: function (e) {
        this.setData({
            password: e.detail.value
        })
    },
    login: function () {

        if (this.data.cqupt_id == "" || this.data.password == "") {
            wx.showToast({
                title: '请输入账号密码',
                icon: "error"
            })
            return
        }
        this.LoginCqupt(this.data.cqupt_id, this.data.password)

    },

    /**
     * 生命周期函数--监听页面加载
     */
    onLoad(options) {
        this.storeBindings = createStoreBindings(this, {
            store,
            fields: ['userInfo', 'hasUserInfo', 'HasUserInfo'],
            actions: ['LoginCqupt']
        });

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

    },

    /**
     * 生命周期函数--监听页面隐藏
     */
    onHide() {

    },

    /**
     * 生命周期函数--监听页面卸载
     */
    onUnload() {
        this.storeBindings.destroyStoreBindings()
    },

    /**
     * 页面相关事件处理函数--监听用户下拉动作
     */
    onPullDownRefresh() {

    },

    /**
     * 页面上拉触底事件的处理函数
     */
    onReachBottom() {

    },

    /**
     * 用户点击右上角分享
     */
    onShareAppMessage() {

    }
})