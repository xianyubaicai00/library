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
          土木工程学院是家里蹲大学主干学院之一。通过多年的建设，学院已发展成为师资力量雄厚、教学成果突出、学科建设成绩显著、科研水平先进的教学科研实体，土木工程学科在全国各轮学科评估中均名列前茅。学院先后获评全国教育系统先进集体、全国教科文卫体系统模范职工小家等荣誉。
          学院现有教职工198人，专任教师170余人，其中教授42人、副教授47人，博导33人、硕导118人，博士学位教师130余人。拥有国家级教学团队、全国黄大年式教师团队、教育部科技创新团队、湖南省自然科学基金创新研究群体、湖南省高校科技创新团队；拥有国家“973计划”项目首席科学家、国家特聘专家、国家教学名师、国家“四青”学者、“百千万人才工程”国家级人选、全国师德标兵、全国优秀科技工作者、国务院特殊政府津贴专家等国家级人才18人次；拥有教育部新世纪优秀人才、交通运输行业中青年科技创新领军人才、湖南省科技领军人才等省部级人才50余人次。
          学院设桥梁工程、建筑工程、岩土与隧道工程、工程力学、智能建造和实验中心6个教学系（中心）。开设土木工程、工程力学、智能建造、城市地下空间工程4个本科专业，其中土木工程入选国家一流本科专业、国家级特色
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
      api.querSchoolSimple(1).then(
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