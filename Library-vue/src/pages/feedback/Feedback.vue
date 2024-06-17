<!-- FeedBack -->
<template>
  <div class="FeedBack">
    <div class="menu-block">
      <el-input
          class="input"
          v-model="input"
          placeholder="请输入用户名"
          clearable
      ></el-input>
      <el-button
          icon="el-icon-search"
          style="float: left; margin-left: 20px"
      ></el-button>
    </div>
    <!-- 数组展示 -->
    <div class="feedback-show">
      <el-empty v-if="input != ''" :image-size="200"></el-empty>
      <div v-else>
        <el-table
            :data="feedbacks"
            :stripe="true"
            style="width: calc(100% - 30px)"
            :default-sort="{ prop: 'date', order: 'descending' }"
            @selection-change="handleSelectionChange"
        >
          <el-table-column type="selection" width="55"></el-table-column>
          <el-table-column fixed prop="title" label="标题" width="120"></el-table-column>
          <el-table-column prop="date" label="时间" width="200">
            <template slot-scope="scope">
              {{ formatDate(scope.row.date) }}
            </template>
          </el-table-column>
          <el-table-column prop="context" label="内容" width="300"></el-table-column>
          <el-table-column prop="tag" label="状态" width="100" align="center">
            <template slot-scope="scope">
              {{ scope.row.tag == 0 ? '未查阅' : scope.row.tag == 1 ? '已查阅' : '已解决' }}
            </template>
          </el-table-column>
          <el-table-column align="left" label="操作" style="align-items: right">
            <template slot-scope="scope">
              <el-button size="mini" @click="showForm(scope.$index)">查阅</el-button>
              <el-button size="mini" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
          </el-table-column>
        </el-table>
      </div>
    </div>
    <!-- 对话框 -->
    <el-dialog :title="form.title" :visible.sync="dialogFormVisible">
      <div
          style="
                    text-align: left;
                    margin: 0px 20px 10px;
                    font-size: 18px;
                    font-weight: 500;
                "
      >
        反馈内容：
      </div>
      <div class="feedback-context">{{ form.context }}</div>
      <!-- 下方确定按钮 -->
      <div slot="footer" class="dialog-footer">
        <el-button @click="dialogFormVisible = false">取 消</el-button>
        <el-button size="mini" type="primary" @click="updateFeedbackStatus(form, 0)">未阅读</el-button>
        <el-button size="mini" type="success" @click="updateFeedbackStatus(form, 1)">已阅读</el-button>
        <el-button size="mini" type="warning" @click="updateFeedbackStatus(form, 3)">已解决</el-button>
      </div>
    </el-dialog>
  </div>
</template>

<script>
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
//例如：import 《组件名称》 from ‘《组件路径》‘;

import api from "@/utils/api";
import {Message} from "element-ui";

export default {
  name: "FeedBack",
  components: {},
  props: [],
  data() {
    //这里存放数据
    return {
      input: '',  // 定义input，用于v-model绑定
      textarea: '',  // 定义textarea，用于v-model绑定
      feedbacks: [],
      dialogFormVisible: false,
      form: {
        feedbackId: "",
        schoolId: "",
        userId: "",
        date: "",
        title: "",
        context: "",
        tag: 0,
      },
    };
  },
  //监听属性 类似于data概念
  computed: {},
  //监控data中的数据变化
  watch: {},
  //方法集合
  methods: {
    getFeedback() {
      const page = 0;  // 页码，根据需要调整
      const size = 10; // 每页显示的条目数
      api.feedbackqueryByPage({page, size}).then(data => {
        console.log(data);
        console.log(data.data);
        console.log(data.data.content);
        console.log(data.data.content.data);
        this.feedbacks = data.data.content;
        console.log("成功获取到反馈内容", this.feedbacks);
      }).catch(error => {
        console.error("获取数据失败", error);
      });
    },
    formatDate(date) {
      const d = new Date(date);
      const year = d.getFullYear();
      const month = ('0' + (d.getMonth() + 1)).slice(-2); // 添加前导零
      const day = ('0' + d.getDate()).slice(-2); // 添加前导零
      return `${year}-${month}-${day}`;
    },
    showForm(row) {
      console.log(this.feedbacks[row]);
      this.form = this.feedbacks[row];
      this.dialogFormVisible = true;
    },
    handleDelete(index, row) {
      let that = this;
      this.$confirm("确定删除？")
          .then((_) => {
            console.log("yes");
            //
            api.deleteFeedback(row.feedbackId).then((data) => {
              Message.success("删除成功");
              that.getFeedback();
            });
            done();
          })
          .catch((_) => {
          });
    },
    updateFeedbackStatus(feedback, newStatus) {
      // 设置新的状态
      feedback.tag = newStatus;
      // 发送 PUT 请求更新后端数据
      api.updateFeedbackStatus(feedback)
          .then(data => {
            console.log('更新成功', data);
            // 可选：反馈给用户更新成功
            this.$message.success('状态更新成功！');

          })
          .catch(error => {
            console.error('更新失败', error);
            // 可选：反馈给用户更新失败
            this.$message.error('状态更新失败，请重试！');
          });
      this.dialogFormVisible = false;
    },
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {
  },
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    this.getFeedback();
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
.FeedBack {
  width: 100%;
  height: 100%;
  background-color: #fff;
  padding: 20px;
}

.menu-block {
  height: 60px;
  padding-left: 10px;

  .input {
    float: left;
    width: 40%;
    min-width: 300px;
  }

  .setting {
    float: right;
    margin-right: 20px;
    font-size: 20px;
    height: 30px;
    top: calc(50% - 15px);
    cursor: pointer;
  }
}

.feedback-context {
  width: 90%;
  margin: auto;
  max-height: 200px;
  text-align: left;
  text-indent: 2em;
  overflow: scroll;
  margin-bottom: 20px;
  // background-color: #eee;
}

.feedback-input {
  width: 90%;
}
</style>