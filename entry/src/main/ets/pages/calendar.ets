import { TopTitleStyle, WeekTitleStyle } from './consts'
import { getNextNMonth, getToday } from './tools'
import { month } from './month'

@Preview
@Component
export struct calendar {
  //------------ 样式控制-----------
  // 当前月视图 是否显示 上/下个月日期, 默认为ture；
  private showOtherMonth = true;
  // “回到今天”快捷键是否显示，默认：true
  private showFastToday: Boolean = true;
  // “回到今天”快捷键名称，默认：“回到今天”
  private FastToday: string = "回到今天";
  // "回到今天"快捷键背景颜色，默认：“gray”
  private FastTodayColor: string = "gray"
  // “完成” 按钮名称,默认为 “完成”
  private selectConfirm: string = "完成";
  //"完成"快捷键背景颜色，默认：“blue”
  private selectConfirmColor: string = "blue"
  // 星期标题，默认：["日","一","二","三","四","五","六",]
  private weeks: string[] = ["日", "一", "二", "三", "四", "五", "六",]
  // ---------------------------------
  // 父组件中@State, @StorageLink和@Link 和子组件@Link可以建立双向数据同步，反之亦然。
  // 当前选中的日期，默认为今天
  @State selectDate: number[] = getToday();
  // @Watch用于监听状态变量的变化，当状态变量变化时，@Watch的回调方法将被调用。
  // 当前日历所处月份的1号
  @State @Watch('currentMonthChanged') currentMonth: number[] = getToday();

  // 当前视图上个月，这个月，下个月1号日期
  @State data: number[][] = [
    getNextNMonth(this.currentMonth, -1),
    getNextNMonth(this.currentMonth, 0),
    getNextNMonth(this.currentMonth, 1)
  ];
  // 当前视图索引,data渲染成三个组件，当前月在下标为1处
  @State currentIndex: number = 1;
  // swiperController
  private swiperController: SwiperController = new SwiperController()


  // swiper切换导致currentMonth变化，更新新的data
  private currentMonthChanged() {
    this.changeView();
  }

  // 改变渲染组件的data值从而改变视图
  // 如果currentIndex=0, 循环模3的视图容器，按上个月就是+1模3 ，按下个月+2模3
  private changeView() {
    let index = this.currentIndex;
    this.data[index] = this.currentMonth;
    this.data[(index + 2) % 3] = getNextNMonth(this.data[index], -1);
    this.data[(index + 1) % 3] = getNextNMonth(this.data[index], 1);
  }

  // 用户点击完成的事件
  private onFinish = () =>{

  }

  // 用户选中日期的事件
  private onSelect = () =>{

  }

  private backToday() {
    //标题刷新
    this.currentMonth = getToday()
    //数据刷新
    this.data = [
      getNextNMonth(this.currentMonth, -1),
      getNextNMonth(this.currentMonth, 0),
      getNextNMonth(this.currentMonth, 1)
    ]
    //index刷新
    this.currentIndex = 1;
  }

  build() {
    Column() {

      //标题区域
      Row() {
        //靠左区域---回到今天快捷键
        Row() {
          if (this.showFastToday) {
            // 回到今天快捷键
            Row() {
              Text(this.FastToday)
                .fontSize(TopTitleStyle.FontSize)
                .fontColor(TopTitleStyle.FontColor)
            }
            .onClick(() => {
              console.info('点击“回到今天”')
              this.backToday()
            })
            .padding({ left: 5, right: 5 })
            .borderRadius(8)
            .backgroundColor('gray')
            .height('60%')
            .justifyContent(FlexAlign.Center)
          }
        }
        .width('30%')
        .height("100%")
        .justifyContent(FlexAlign.Center)

        //中间区域---上月 当前月 下月
        Row() {
          Row() {
            Text("<")
              .fontSize(TopTitleStyle.FontSize)
              .fontColor(TopTitleStyle.FontColor)
          }
          .onClick(() => {
            console.info('点击了 “上个月"')
            this.swiperController.showPrevious()
            console.info("目前是" + this.currentMonth[0] + "年" + this.currentMonth[1] + "月")
          })
          .justifyContent(FlexAlign.Center)
          .width('20%')
          .height('100%')

          Row() {
            Text(this.currentMonth[0].toString() + "年" + this.currentMonth[1].toString() + "月")
              .fontSize(TopTitleStyle.FontSize)
              .fontColor(TopTitleStyle.FontColor)
          }
          .width('60%')
          .height('100%')
          .justifyContent(FlexAlign.Center)

          Row() {
            Text(">")
              .fontSize(TopTitleStyle.FontSize)
              .fontColor(TopTitleStyle.FontColor)
          }
          .onClick(() => {
            console.info('点击 “下个月"')
            this.swiperController.showNext()
          })
          .width('20%')
          .height('100%')
          .justifyContent(FlexAlign.Center)
        }
        .height('100%')
        .width('40%')

        //靠右区域---完成并返回键
        Row() {
          if (this.showFastToday) {
            // 回到今天快捷键
            Row() {
              Text(this.selectConfirm)
                .fontSize(TopTitleStyle.FontSize)
                .fontColor(TopTitleStyle.FontColor)
            }
            .onClick(() => {
              console.info('点击“完成”')
              this.onFinish()
            })
            .padding({ left: 5, right: 5 })
            .borderRadius(8)
            .backgroundColor('blue')
            .width('80%')
            .height('60%')
            .justifyContent(FlexAlign.Center)
          }
        }
        .width('30%')
        .height("100%")
        .justifyContent(FlexAlign.Center)

      }
      .width('100%')
      .height(TopTitleStyle.Height)
      .backgroundColor(TopTitleStyle.BackgroundColor)

      // 星期标题区域
      Row() {
        ForEach(["日", "一", "二", "三", "四", "五", "六"], (item: string, index: number) => {
          Column() {
            Text(item)
              .fontColor(WeekTitleStyle.FontColor)
              .fontSize(WeekTitleStyle.FontSize)
              .fontWeight(WeekTitleStyle.FontWeight)
          }
          .layoutWeight(1)
          .height('100%')
        })
      }
      .width('100%')
      .height(WeekTitleStyle.Height)
      .backgroundColor(WeekTitleStyle.BackgroundColor)

      // 日期区域
      Column() {
        // Swiper实现试图的滑动切换，保存 上个月，当前月，下个月日期
        Swiper(this.swiperController) {
          ForEach(this.data, (item: number[]) => {
            month({
              selectDate: $selectDate,
              monthStart: item,
              onSelect: this.onSelect()
            })
          })
        }
        .cachedCount(3)
        .loop(true)
        .index(this.currentIndex) //当前显示的子组件的索引值
        .indicator(false)
        .width('100%')
        // 当前显示的子组件索引变化时触发该事件,返回值为当前显示的子组件的索引值。
        .onChange((index: number) => {
          this.currentIndex = index;
          this.currentMonth = this.data[this.currentIndex];
          console.info("SwiperIndex:" + index.toString())
        })

      }
      .backgroundColor("yellow")
      .height('80%')

      Column() {

      }
    }
    .height('100%')
    .width('100%')
  }
}