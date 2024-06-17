<!-- EditSeat -->
<template>
  <div class="Edit">
    <!-- menu -->
    <div class="menu">
      <div class="menu-item back" @click="back()">
        <i class="el-icon-arrow-left"></i>返回
      </div>
      <div class="menu-item room-name">{{ room.name }}</div>

      <!-- 保存 -->
      <div class="menu-item submit" @click="submit()">保存</div>
    </div>
    <div class="main">
      <div class="main-left">
        <div
            id="panzoom"
            :style="{
                        padding: paddingTop + 'px ' + paddingLeft + 'px',
                    }"
        >

          <!-- 椅子 -->
          <img
              class="yizi"
              @click="onClick($event, idx)"
              v-for="(seat, idx) in seats"
              :key="seat.seatId"
              :id="seat.seatId"
              :src="seat.red ? require('@/assets/img/library/yizi-red.svg') : require('@/assets/img/library/yizi-normal.svg')"
              alt=""
              :style="{
                            width: itemWidth + 'px',
                            left: paddingLeft + seat.x * itemWidth + 'px',
                            top: paddingTop + seat.y * itemWidth + 'px',
                            '-webkit-transform':
                                'rotate(' + seat.direction * 90 + 'deg)',
                        }"
          />
          <!-- 桌子 -->
          <div
              class="zhuozi"
              @click="onClick($event, idex)"
              v-for="(table, idex) in tables"
              :key="table.tableId"
              :id="table.tableId"
              :style="{
                            width: itemWidth + 'px',
                            height: itemWidth * 2 + 'px',
                            left:
                                paddingLeft +
                                (table.x + table.direction * 2) * itemWidth +
                                'px',
                            top: paddingTop + table.y * itemWidth + 'px',
                            '-webkit-transform':
                                'rotate(' + table.direction * 90 + 'deg)',
                        }"
          ></div>
        </div>
      </div>
      <div class="main-right">
        <div class="oprate-add">
          <el-select v-model="selectedDate" placeholder="选择日期">
            <el-option
                v-for="date in dates"
                :key="date"
                :label="date"
                :value="date">
            </el-option>
          </el-select>

          <el-select v-model="selectedTime" placeholder="选择时间段" style="margin-left: 10px;">
            <el-option
                v-for="time in times"
                :key="time"
                :label="time"
                :value="time">
            </el-option>
          </el-select>
        </div>
      </div>
    </div>
  </div>
</template>

<script>
import api from "@/utils/api";
import Panzoom from "@panzoom/panzoom";
import {Message} from "element-ui";
//这里可以导入其他文件（比如：组件，工具js，第三方插件js，json文件，图片文件等等）
//例如：import 《组件名称》 from ‘《组件路径》‘;
const itemMaxWidth = 60;

const randomID = () => Math.random().toString(36).substring(2);
export default {
  name: "Edit",
  components: {},
  props: ["roomId"],
  data() {
    //这里存放数据
    return {
      // 房间信息
      room: {},
      dates: ["今天", "明天"],
      times: [
        "8:00-10:00", "10:00-12:00", "12:00-14:00", "14:00-16:00", "16:00-18:00", "18:00-20:00", "20:00-22:00"
      ],
      selectedDate: '',  // 选中的日期
      selectedTime: '',  // 选中的时间段
      // panZoom的上白部分
      paddingTop: 0,
      // panzoom 左白部分
      paddingLeft: 0,
      // 图标宽度
      itemWidth: 100,
      maxX: 0,
      maxY: 0,
      // 最下右
      maxYr: 0,
      lastX: 0,
      lastY: 0,
      // 选中id
      itemType: 0,
      itemId: "",
      // 选中表单
      form: {},
      oldForm: {},
      seats: [],
      tables: [],
    };
  },
  //监听属性 类似于data概念
  computed: {},
  //监控data中的数据变化
  watch: {
    selectedDate(newVal) {
      this.handleSelectionChange();
    },
    selectedTime(newVal) {
      this.handleSelectionChange();
    }
  },
  //方法集合
  methods: {
    handleSelectionChange() {
      const isToday = this.selectedDate === "今天";
      const timeIndex = this.times.indexOf(this.selectedTime);  // Converts time to index
      if (timeIndex !== -1) {
        this.queryRoomBySelection(isToday, timeIndex);
      }
    },
    queryRoomBySelection(isToday, timeIndex) {
      api.queryRoomByTime(this.roomId, isToday, timeIndex).then((data) => {
        console.log(data);
        this.room = data.data;
        this.cacul(data.data);
      });
    },
    init() {
      var elem = document.getElementById("panzoom");
      const panzoom = Panzoom(elem, {
        maxScale: 3.5,
        minScale: 1,
      });
      panzoom.pan(10, 10);
      panzoom.zoom(1, {animate: true});
      elem.parentElement.addEventListener("wheel", panzoom.zoomWithWheel);
      let f = {
        target: {id: "A1227"},
      };
    },
    queryRoom() {
      console.log(this.roomId)
      api.queryRoomByTime(this.roomId, true, 5).then((data) => {
        console.log(data);
        this.room = data.data;
        // 获取后计算宽度
        this.cacul(data.data);
      });
    },
    cacul(data) {
      this.seats = data.librarySeats;
      this.tables = data.libraryTables;
      let maxX = 0; // 最右
      let maxY = 0; // 最下
      let maxYr = 0; // 最下右
      this.seats.forEach((el) => {
        if (el.x > maxX) {
          maxX = el.x;
        }
        if (el.y > maxY) {
          maxY = el.y;
          maxYr = el.x;
        } else if (el.y == maxY && el.x > maxYr) {
          maxYr = el.x;
        }
      });
      // 桌子不一样 因为宽度不同
      this.tables.forEach((el) => {
        if (el.x + el.direction > maxX) {
          maxX = el.x + el.direction;
        }

        if (el.y + (1 - el.direction) > maxY) {
          maxY = el.y + (1 - el.direction);
          maxYr = el.x + el.direction;
        } else if (
            el.y + (1 - el.direction) == maxY &&
            el.x + el.direction > maxYr
        ) {
          maxYr = el.x + el.direction;
        }
      });
      // console.log(maxX, maxY, maxYr);
      this.maxX = maxX;
      this.maxY = maxY;
      this.maxYr = maxYr;
      // 取较长的一边作为最长
      let maxWidth = maxX > maxY ? maxX : maxY;
      // console.log(this.maxX);
      // 1. 第一次，先用最大 先保证宽
      // 得到width
      // this.clientHeight=462;
      console.log(
          document.getElementById("panzoom").clientWidth,
          document.getElementById("panzoom").clientHeight
      );
      this.itemWidth = 54;
      // document.getElementById("panzoom").clientWidth / (maxWidth + 1);

      console.log("itemWidth: ", this.itemWidth);
      // 算paddingtop
      this.caculPadding(maxWidth, maxX, maxY);

      // 2  如果高度超出视野，重新算
      if (this.paddingTop < 0) {
        // 已Y为标准
        this.itemWidth =
            document.getElementById("panzoom").clientHeight /
            (maxY + 1);
        this.caculPadding(maxWidth, maxX, maxY);
      }

      // 3 最后保证大小
      if (this.itemWidth > itemMaxWidth) {
        console.log("超过了：", this.itemWidth);
        this.itemWidth = 38.5;
        // this.itemWidth=38.5;
        this.caculPadding(maxWidth, maxX, maxY);
      }
      this.itemWidth = 38.5;
      console.log("最后保证大小 38.5..." + this.itemWidth, this.paddingTop, this.paddingLeft);
      console.log("seats is" + this.seats)
    },
    caculPadding(maxWidth, maxX, maxY) {
      this.paddingLeft = 0;
      this.paddingTop = 0;
      this.paddingTop =
          (document.getElementById("panzoom").clientHeight -
              this.itemWidth * (maxY + 1)) /
          2;
      this.paddingLeft =
          (document.getElementById("panzoom").clientWidth -
              this.itemWidth * (maxX + 1)) /
          2;
      console.log(this.itemWidth, this.paddingTop, this.paddingLeft);
    },
    addYizi() {
      let that = this;
      if (this.form.x != null) {
        this.lastX = this.form.x + 1;
        this.lastY = this.form.y;
      } else {
        this.lastX = this.maxYr + 1;
        this.lastY = this.maxY;
      }

      this.form = {
        seatId: randomID() + randomID(),
        name: randomID(),
        direction: 0,
        repair: 0,
        height: 1,
        width: 1,
        red: false,
        roomId: this.room.roomId,
        x: this.form.x != null ? this.form.x + 1 : this.maxYr + 1,
        y: this.form.x != null ? this.form.y : this.maxY,
      };
      this.room.librarySeats.push(this.form);
      this.cacul(this.room);
      let e = {
        target: {
          id: this.form.seatId,
        },
      };
      setTimeout(() => {
        that.onClick(e, 1);
      }, 100);
    },
    // 添加桌子
    addZhuozi() {
      let that = this;

      this.form = {
        tableId: randomID() + randomID(),
        name: randomID(),
        direction: 0,
        height: 1,
        width: 1,
        roomId: this.room.roomId,
        x: this.form.x != null ? this.form.x + 1 : this.maxYr + 1,
        y: this.form.x != null ? this.form.y : this.maxY,
      };
      this.room.libraryTables.push(this.form);
      this.cacul(this.room);
      let e = {
        target: {
          id: this.form.tableId,
        },
      };
      setTimeout(() => {
        that.onClick(e, 1);
      }, 100);
    },
    // 改变位置
    changePosition(tag, tt) {
      // console.log("changePosition");
      if (this.form[tag] == 0 && tt == -1) return;
      this.form[tag] += tt;
      if (tag == "x") this.lastX = this.form[tag] + 1;
      else this.lastY = this.form[tag] + 1;
    },
    // 改变方向
    changeDirection() {
      // 椅子
      this.form.direction += 1;
      if (this.itemType == 0) {
        if (this.form.direction == 4) this.form.direction = 0;
      } else {
        if (this.form.direction == 2) this.form.direction = 0;
      }
    },
    // 点击桌椅
    onClick(e, idx) {
      console.log(e.target.id, idx);
      // 获取id 修改背景色
      if (this.itemId != "") {
        document.getElementById(this.itemId).style.background = "";
      }
      if (this.itemId != e.target.id) {
        document.getElementById(e.target.id).style.background =
            "rgba(243, 213, 222,0.7)";
        this.itemId = e.target.id;
      } else {
        this.itemId = "";
        this.form = {};
        return;
      }
      // 获取类型和详细信息
      this.seats.forEach((el) => {
        if (el.seatId == this.itemId) {
          this.itemType = 0;
          this.form = el;
          this.oldForm = {...el};
        }
      });
      this.tables.forEach((el) => {
        if (el.tableId == this.itemId) {
          this.itemType = 1;
          this.form = el;
          this.oldForm = {...el};
        }
      });
    },
    // 取消
    cancel() {
      console.log("cancle");
      Object.keys(this.oldForm).forEach((key) => {
        this.form[key] = this.oldForm[key];
      });
    },
    // 删除
    handleDelete() {
      let that = this;
      if (this.itemType == 0) {
        // 椅子
        this.$confirm("确定删除该座位吗？")
            .then((_) => {
              api.deleteSeat(this.form.seatId).then((data) => {
                this.form = {};
                this.itemId = ""
                Message.success("删除成功");
                that.queryRoom();
              });
            })
            .catch((_) => {
            });
      } else {
        //   桌子
        this.$confirm("确定删除该座位吗？")
            .then((_) => {
              api.deleteTable(this.form.tableId).then((data) => {
                this.form = {};
                this.itemId = ""
                Message.success("删除成功");
                that.queryRoom();
              });
            })
            .catch((_) => {
            });
      }
    },
    // 保存
    submit() {
      api.insertOrUpdateSeat(this.seats).then((data) => {
        Message.success("椅子保存成功");
      });
      api.insertOrUpdateTable(this.tables).then((data) => {
        let e = {
          target: {
            id:
                this.form.seatId == null
                    ? this.form.tableId
                    : this.form.seatId,
          },
        };
        this.onClick(e, -1);
        this.queryRoom();
        Message.success("座位保存成功");
      });
    },

    back() {
      this.$emit('back'); // Make sure this is linked to a button or some event in the template
    }
  },
  // 返回到房间管理
  //生命周期 - 创建完成（可以访问当前this实例）
  created() {
  },
  //生命周期 - 挂载完成（可以访问DOM元素）
  mounted() {
    setTimeout(() => {
      this.queryRoom();
    }, 300);
    this.init();
    // 全局监听键盘左右键事件
    var that = this;
    document.onkeypress = function (e) {
      if (e.code === "KeyA") {
        that.changePosition("x", -1);
      } else if (e.code === "KeyD") {
        that.changePosition("x", 1);
      } else if (e.code === "KeyW") {
        that.changePosition("y", -1);
      } else if (e.code === "KeyS") {
        that.changePosition("y", 1);
      }
      // console.log(e.code);
    };

    document.onkeyup = function (e) {
      if (e.code === "ArrowLeft") {
        that.changePosition("x", -1);
      } else if (e.code === "ArrowRight") {
        that.changePosition("x", 1);
      } else if (e.code === "ArrowUp") {
        that.changePosition("y", -1);
      } else if (e.code === "ArrowDown") {
        that.changePosition("y", 1);
      } else if (e.code === "Space") {
        that.changeDirection();
      }
      // console.log(e.code);
    };
  },
};
</script>
<style lang="less" scoped>
.EditSeat {
  width: 100%;
  height: 100%;
}

.menu {
  height: 40px;
  font-size: 18px;
  line-height: 30px;

  .menu-item {
    float: left;
  }

  .back {
    cursor: pointer;
    user-select: none;
  }

  .back:hover {
    font-weight: 800;
  }

  .room-name {
    margin-left: 30px;
    font-size: 16px;
    font-weight: 500;
    color: #666;
  }

  .submit {
    float: right;
    margin-right: 20px;
    width: 100px;
    font-size: 14px;
    line-height: 30px;
    padding: 0px 26px;
    background: #8ab2ed;
    border-radius: 15px;
    color: #fff;
    cursor: pointer;
    user-select: none;
  }
}

.main {
  height: calc(100% - 40px);
  width: 1000px;
}

.main-left {
  float: left;
  width: calc(100% - 240px);
  height: 1000px;
  background: #f2f2f2;
  //padding: 5%;

  #panzoom {
    width: 100%;
    height: 100%;
    // background-color: #fff;
    .yizi {
      display: inline-block;
      position: absolute;
      left: 0;
      cursor: pointer;
    }

    .zhuozi {
      transform-origin: left top;
      display: inline-block;
      position: absolute;
      cursor: pointer;
      height: 200px;
      width: 100px;
      background: rgba(165, 218, 252, 0.9);
    }
  }
}

.main-right {
  float: right;
  height: 100%;
  width: 240px;
  background: #e6eef4;

  .oprate-add {
    padding: 20px;
    border-bottom: 1px solid #cacaca;
  }

  .oprate-show {
    margin-top: 20px;

    .item {
      margin-bottom: 10px;
    }
  }

  .btu {
    margin: auto;
    margin-top: 20px;
    width: 140px;
    font-size: 14px;
    line-height: 30px;
    padding: 0px 26px;
    background: #ccc;
    border-radius: 15px;
    color: #fff;
    cursor: pointer;
    user-select: none;
  }
}
</style>
