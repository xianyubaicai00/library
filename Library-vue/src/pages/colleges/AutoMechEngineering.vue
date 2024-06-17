<!-- Settings -->
<template>
  <div class="auto-mech-engineering">
    <div class="main" v-if="hasSchool">
      <div class="schoolhead">
        <img
            class="icon"
            src="https://picb1.photophoto.cn/36/258/36258491_1.jpg"
            alt=""
        />
        <span class="schoolName">{{ school4.name }}</span>
        <el-button
            style="margin-left: 40px; position: relative; top: -4px"
            @click="edit"
        >编辑
        </el-button
        >
      </div>

      <div style="margin-top: 40px">
        <div style="text-indent: 2em">
          家里蹲大学计通学院的本科法学教育始于2000年。家里蹲大学法学教育的组织机构历经家里蹲大学政治与行政学院法学系（2003年）、法学院（2006）、文法学院（马克思主义学院）法学系（2008年）、文法学院法学系（2011年）、法学系（独立设置的学校二级单位，2019年）、法学院（2021年）等发展阶段。法学院发展至今，在人才培养、专业建设、学科发展、科学研究、师资队伍建设等方面取得了显著成绩。
          法学院形成了较为完整并颇具特色的学科和专业体系。法学院现有一个本科专业和一个法学第二学士学位专业。法学本科专业招生始于2000年，2007年列入本科一批招生；2010年，法学专业依托学校工程学科优势以及社会建设发展需求，开设工程法学和社会法学两个专业方向；2011年在马克思主义理论一级学科硕士点内开设马克思主义法理学方向，开始培养法学硕士研究生；2014年获得法律硕士专业学位授权点开始培养法律硕士。法律硕士授权点依托学校在交通、电力、水利、土木建筑等行业的学科优势和行业资源，以社会需求为导向，开设工程法、社会法专业方向，以满足社会对专门法律人才的需求。2015年，法学专业被列为学校重点建设专业
        </div>
      </div>
      <div style="margin-top: 20px">
        <div></div>
        <img class="image" :src="'api' + school4.background" alt=""/>
      </div>
    </div>

    <el-empty
        v-if="!hasSchool"
        :image-size="200"
        description="没有创建学校"
    >
      <el-button @click="createSchool()"> 点击创建学校</el-button>
    </el-empty>

    <!--  抽屉 -->
    <el-drawer
        :title="title"
        :visible.sync="drawer"
        direction="rtl"
        :before-close="handleClose"
    >
      <div style="width: 90%">
        <el-form ref="form" :model="form" label-width="80px">
          <el-form-item label="名称">
            <el-input v-model="form.name"></el-input>
          </el-form-item>

          <el-form-item label="图标">
            <el-upload
                class="upload-icon"
                drag
                action="https://jsonplaceholder.typicode.com/posts/"
                multiple
            >
              <i class="el-icon-upload"></i>
              <div class="el-upload__text">
                <em>点击上传</em>或拖拽
              </div>
            </el-upload>
          </el-form-item>

          <el-form-item label="描述">
            <el-input
                type="textarea"
                rows="10"
                v-model="form.descs"
            ></el-input>
          </el-form-item>
          <el-form-item label="背景">
            <el-upload
                class="upload-demo"
                drag
                action="https://jsonplaceholder.typicode.com/posts/"
                multiple
            >
              <i class="el-icon-upload"></i>
              <div class="el-upload__text">
                将文件拖到此处，或<em>点击上传</em>
              </div>
            </el-upload>
          </el-form-item>

          <el-form-item style="float: right">
            <el-button @click="drawer = false">取消</el-button>
            <el-button type="primary" @click="onSubmit"
            >保存
            </el-button
            >
          </el-form-item>
        </el-form>
      </div>
    </el-drawer>
  </div>
</template>

<script>
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
//例如：import 《组件名称》 from ‘《组件路径》‘;

import api from "@/utils/api";

export default {
  name: "School",
  components: {},
  props: [],
  data() {
    //这里存放数据
    return {
      title: "编辑学校信息",
      drawer: false,
      school4: [],
      form: {
        name: "",
        descs: "",
        background: "",
      },
    };
  },
  //监听属性 类似于data概念
  computed: {},
  //监控data中的数据变化
  watch: {},
  //方法集合
  methods: {
    edit() {
      this.title = "编辑管理的学校";
      this.form = this.school;
      this.drawer = true;
    },
    // 创建学校
    createSchool() {
      this.title = "添加管理的学校";
      this.drawer = true;
    },
    // 关闭抽屉
    handleClose(done) {
      this.$confirm("保存并关闭？")
          .then((_) => {
            done();
          })
          .catch((_) => {
          });
    },
    // 提交保存
    onSubmit() {
      api.updateSchool(this.form)  // 使用表单数据
          .then(
              data => {
                // 处理响应
                this.drawer = false;  // 假设提交后你想关闭抽屉
                this.$message.success('学校信息更新成功');
              })
          .catch(error => {
            // 处理错误
            console.error('更新失败:', error);
            this.$message.error('学校信息更新失败');
          });
    },


    school() {
      return this.$store.state.school;
    },
    hasSchool() {
      api.querSchoolSimple(4).then(
          data => {
            console.log("获得到数据" + data);
            this.school4 = data.data;
          }
      )
      return this.$store.state.school.hasSchool;
    },
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {

  },
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    this.hasSchool();
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
.School {
  width: 100%;
  height: 100%;
  background: #fff;
  padding: 20px;
  text-align: left;
}

.main {
  width: 800px;
  margin: auto;
}

.icon {
  height: 100px;
}

.label {
  display: inline-block;
  font-size: 20px;
  margin-right: 10px;
}

.schoolName {
  line-height: 100px;
  margin-left: 20px;
  font-size: 26px;
}

.image {
  width: 100%;
}

// 设置drawer的
.upload-icon,
/deep/ .upload-icon > .el-upload,
/deep/ .upload-icon > .el-upload > .el-upload-dragger {
  height: 160px !important;
  width: 160px !important;
}

.upload-demo,
/deep/ .upload-demo > .el-upload,
/deep/ .upload-demo > .el-upload > .el-upload-dragger {
  width: 100% !important;
}

/deep/ .el-drawer {
  min-width: 400px;
}
</style>