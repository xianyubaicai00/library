<!-- Aside -->
<template>
  <div class="Aside">
    <el-menu
        :default-openeds="['1', '2']"
        background-color="transparent"
        active-text-color="#2d72cc"
        :default-active="activeIndex"
        @select="handleSelect"
    >
      <el-menu-item index="home">
        <img
            class="label-icon"
            :src="require('@/assets/img/home.svg')"
            alt=""
        />
        首页
      </el-menu-item>
      <el-submenu index="1">
        <template slot="title">
          <img
              class="label-icon"
              :src="require('@/assets/img/school.svg')"
              alt=""
          />学校管理
        </template>
        <el-menu-item index="school">学校信息</el-menu-item>
        <el-menu-item index="notification">通知管理</el-menu-item>
        <el-menu-item index="library">图书馆管理</el-menu-item>
        <el-menu-item index="seat">图书室管理</el-menu-item>
      </el-submenu>

      <!--         <el-submenu index="0">-->
      <!--            <template slot="title">-->
      <!--              <img class="label-icon" :src="require('@/assets/img/school.svg')" alt=""/>学院管理-->
      <!--            </template>-->
      <!--            <el-menu-item index="civil-engineering">土木工程学院</el-menu-item>-->
      <!--            <el-menu-item index="electrical-info-eng">电气学院</el-menu-item>-->
      <!--            <el-menu-item index="transport-engineering">交通学院</el-menu-item>-->
      <!--            <el-menu-item index="auto-mech-engineering">计通学院</el-menu-item>-->
      <!--          </el-submenu>-->

      <el-submenu index="2">
        <template slot="title">
          <i class="el-icon-date"></i>预约管理
        </template>
        <el-menu-item index="receive">预约管理</el-menu-item>
        <el-menu-item index="CatSeat">预约可视化</el-menu-item>
        <el-menu-item index="receivefast">快速预约</el-menu-item>
        <el-menu-item index="receiveRule">预约规则</el-menu-item>


      </el-submenu>
      <el-menu-item index="credit">
        <i class="el-icon-bank-card"></i>信用管理
      </el-menu-item>
      <el-menu-item index="feedback">
        <i class="el-icon-bell"></i>反馈消息
      </el-menu-item>

      <el-menu-item index="user">
        <i class="el-icon-user"></i>用户管理
      </el-menu-item>
      <el-menu-item index="settings"
      ><i class="el-icon-setting"></i>设置
      </el-menu-item
      >
    </el-menu>
    <div class="beian"></div>
  </div>
</template>

<script>
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
//例如：import 《组件名称》 from ‘《组件路径》‘;

export default {
  components: {},
  props: [],
  data() {
    //这里存放数据
    return {
      activeIndex: "home",
    };
  },
  //监听属性 类似于data概念
  computed: {},
  //监控data中的数据变化
  watch: {},
  //方法集合
  methods: {
    handleSelect(key, keyPath) {
      let url = "/" + keyPath[keyPath.length - 1];
      this.$router.push({
        path: url,
      });
    },
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {
  },
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    let path = this.$route.path.substring(1);
    if (path == "") path = "home";
    this.activeIndex = path;
  },
  beforeCreate() {
  }, //生命周期 - 创建之前
  beforeMount() {
  }, //生命周期 - 挂载之前
  beforeUpdate() {
  }, //生命周期 - 更新之前
  updated() {
  }, //生命周期 - 更新之后
  beforeDestroy() {
  }, //生命周期 - 销毁之前
  destroyed() {
  }, //生命周期 - 销毁完成
  activated() {
  }, //如果页面有keep-alive缓存功能，这个函数会触发
};
</script>
<style lang="less" scoped>
* {
  text-align: left;
  color: #000;
  user-select: none;
}

.label-icon {
  position: relative;
  display: inline-block;
  padding: 0 3px;
  margin-right: 5px;
  width: 24px;
}

//子级的类名

.el-menu-item:hover {
  background-color: #eee !important;
}

.el-submenu /deep/ .el-submenu__title:hover {
  background-color: #eee !important;
}

.beian {
  height: 30px;
  width: 100%;
  text-align: center;
}
</style>
