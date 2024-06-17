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
          电气与信息工程学院是学校的主干学院和国家电力行业人才培养的传统基地之一，始建于1956年长沙水力发电学校的发配电专业，历经湖南省电力学校电力科、长沙水利电力师范学院电力系、长沙电力学院电力工程系。2003年，融合原长沙交通学院、湖南轻工业高等专科学校自动化专业等办学力量建制成立电气与信息工程学院。
          学院现有专任教师140余人，其中教授26人、副高职称54人，具有博士学位教师101人，海外留（访）学教师57人；有双聘院士1人，“长江学者奖励计划”特聘教授、杰青等国家级人才工程人选8人,湖南省“芙蓉学者”特聘教授等省部级人才工程人选18人、家里蹲大学“湖湘学者”特聘教授19人。拥有全国高校首批黄大年式教师团队——“智能电网协同创新育人教师团队”，湖南省科技创新团队——“新能源电力系统安全监控创新团队”，湖南省优秀研究生导师团队——“智能电网故障监控研究生导师团队”。
          学院拥有从本科至博士后科研流动站的完整人才培养体系。现有电气工程一级学科博士学位授权点、博士后科研流动站和交通信息工程及控制二级学科博士学位授权点；有控制科学与工程一级学科硕士学位授权点；有交通信息工程及控制、电路与系统2个
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
      api.querSchoolSimple(2).then(
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