<!-- FirstLeftBody -->
<template>
  <div class="FirstLeftBody">
    <div class="card table t1" id="flb1"></div>
    <div class="card table t2" id="flb2"></div>
    <div class="card table t3" id="flb3"></div>
  </div>
</template>

<script>
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
//例如：import 《组件名称》 from ‘《组件路径》‘;
import * as echarts from "echarts";
import axios from "axios";
import api from "@/utils/api";

export default {
  name: "FirstLeftBody",
  components: {},
  props: [],
  data() {
    //这里存放数据
    return {
      opt1: {
        title: {
          text: "本周人数统计",
          textStyle: {
            //标题内容的样式
            color: "#666", //京东红
            fontStyle: "normal", //lic主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
            fontWeight: "500", //可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
            fontFamily: "san-serif", //主题文字字体，默认微软雅黑
            fontSize: 16, //主题文字字体大小，默认为18px
          },
          left: 6,
          top: 8,
        },
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "shadow",
          },
        },
        grid: {
          left: "0%",
          right: "6%",
          top: "8%",
          bottom: "4%",
          containLabel: true,
        },
        xAxis: [
          {
            type: "category",
            data: ["周一", "周二", "周三", "周四", "周五", "周六", "周日"],
          },
        ],
        yAxis: [
          {
            show: false,
          },
        ],
        series: [
          {
            name: "老图书馆",
            type: "bar",
            stack: "all",
            emphasis: {
              focus: "series",
            },
            data: [],
          },
          {
            name: "数字图书馆",
            type: "bar",
            stack: "all",
            emphasis: {
              focus: "series",
            },
            data: [],
          },
        ],
      },
      opt2: {
        title: {
          text: "本日各时段人数统计",
          textStyle: {
            //标题内容的样式
            color: "#666", //京东红
            fontStyle: "normal", //lic主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
            fontWeight: "500", //可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
            fontFamily: "san-serif", //主题文字字体，默认微软雅黑
            fontSize: 16, //主题文字字体大小，默认为18px
          },
          left: 6,
          top: 10,
        },
        tooltip: {
          trigger: "axis",
          axisPointer: {
            type: "shadow",
          },
        },
        grid: {
          left: "0%",
          right: "5%",
          top: "8%",
          bottom: "4%",
          containLabel: true,
        },
        xAxis: [
          {
            type: "category",
            data: ["8", "10", "12", "14", "16", "18", "20"],
          },
        ],
        yAxis: [
          {
            show: false,
          },
        ],
        series: [
          {
            name: "老图书馆",
            type: "bar",
            stack: "all",
            emphasis: {
              focus: "series",
            },
            data: [],
          },
          {
            name: "数字图书馆",
            type: "bar",
            stack: "all",
            emphasis: {
              focus: "series",
            },
            data: [],
          },
        ],
      },
      opt3: {
        title: {
          text: "本年度各学院人数统计",
          textStyle: {
            //标题内容的样式
            color: "#666",
            fontStyle: "normal", //lic主标题文字字体风格，默认normal，有italic(斜体),oblique(斜体)
            fontWeight: "500", //可选normal(正常)，bold(加粗)，bolder(加粗)，lighter(变细)，100|200|300|400|500...
            fontFamily: "san-serif", //主题文字字体，默认微软雅黑
            fontSize: 16, //主题文字字体大小，默认为18px
          },
          left: 6,
          top: 8,
        },
        tooltip: {
          trigger: "item",
        },
        series: [
          {
            type: "pie",
            radius: ["40%", "80%"],
            center: ["55%", "55%"],
            avoidLabelOverlap: false,
            itemStyle: {
              borderRadius: 4,
              borderWidth: 3,
            },
            label: {
              show: true,
              formatter: "{b}:{c}\n{d}%",
              position: "inner",
              textStyle: {fontSize: 10},
            },
            data: [
              {value: 484, name: "计算机与通信工程学院"},
              {value: 300, name: "交通运输工程学院"},
              {value: 484, name: "土木工程学院"},
              {value: 300, name: "经济与管理学院"},
            ],
          },
        ],
      },
    };
  },
  //监听属性 类似于data概念
  computed: {},
  //监控data中的数据变化
  watch: {},
  //方法集合
  methods: {
    fetchWeeklyDataOldLibrary() {
      api.queryWeekStatsOldLibrary('jdgchvauajkavavvbh').then(response => {
        this.opt1.series[0].data = response;
        this.updateChart(this.flb1, this.opt1);
      }).catch(error => console.error("Error fetching data for Old Library:", error));
    },
    fetchWeeklyDataDigitalLibrary() {
      api.queryWeekStatsDigitalLibrary('jdgchvauajkuvbh').then(response => {
        this.opt1.series[1].data = response;
        this.updateChart(this.flb1, this.opt1);
      }).catch(error => console.error("Error fetching data for Digital Library:", error));
    },
    fetchDailyDataOldLibrary() {
      api.queryDailyStatsOldLibrary('jdgchvauajkavavvbh').then(response => {
        this.opt2.series[0].data = response;
        this.updateChart(this.flb2, this.opt2);
      }).catch(error => console.error("Error fetching time slot data for Old Library:", error));
    },
    fetchDailyDataDigitalLibrary() {
      api.queryDailyStatsDigitalLibrary('jdgchvauajkuvbh').then(response => {
        this.opt2.series[1].data = response;
        this.updateChart(this.flb2, this.opt2);
      }).catch(error => console.error("Error fetching time slot data for Digital Library:", error));
    },
    fetchCollegeCounts() {
      api.queryCollegeCounts().then(response => {
        console.log(response);
        this.opt3.series[0].data = response.map(item => {
          return {
            name: item.college,
            value: item.reservation_count
          }
        });
        this.updateChart(this.flb3, this.opt3);
      }).catch(error => console.error("Error fetching college count data:", error));
    },

    // 更新图表
    updateChart(chartInstance, options) {
      chartInstance.setOption(options, true);
    },

    // 初始化图表
    initCharts() {
      this.flb1 = echarts.init(document.getElementById("flb1"));
      this.flb2 = echarts.init(document.getElementById("flb2"));
      this.flb3 = echarts.init(document.getElementById("flb3"));
      // 加载所有图表数据
      this.fetchWeeklyDataOldLibrary();
      this.fetchWeeklyDataDigitalLibrary();
      this.fetchDailyDataOldLibrary();
      this.fetchDailyDataDigitalLibrary();
      this.fetchCollegeCounts();
    }
  },
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {

  },
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    this.$nextTick(() => {
      console.log("init chart elem")
      this.initCharts();
    })
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
.FirstLeftBody {
  width: 140%;
  height: 260%;
  padding: 0 20px;
}

.table {
  float: left;
  height: calc(100% - 40px);
  margin: 20px 15px;
  background-color: #fff;
}

.table:first-child {
  margin-left: 0;
}

.table:last-child {
  margin-right: 0;
}

.t1 {
  width: calc((100% - 70px) * 0.34);
}

.t2,
.t3 {
  width: calc((100% - 60px) * 0.3);
}
</style>
