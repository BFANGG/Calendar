import { TitleStyle } from './consts'
import { MyDataSource } from './MyDataSource'

@Entry
@Preview
@Component
struct calendar {
  // 当前选中的日期，默认为今天
  private selectDate: number[] = [2024, 6, 17];
  // 当前日历所处月份
  private titleMonth: number[] = [2024, 6];
  // swiperController
  private swiperController: SwiperController = new SwiperController()
  // 当前视图目前，上个月，下个月数据源
  private data: MyDataSource = new MyDataSource([]);

  aboutToAppear(): void {
    let list = []
    for (var i = 1; i <= 3; i++) {
      list.push(i.toString());
    }
    this.data = new MyDataSource(list)
  }

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
  // 星期标题字体大小，默认：12
  private weekTitleFontSize: number = 12
  private TopTitleStyle: TitleStyle = {
    FontColor: "#252a34",
    FontSize: 15,
    FontWeight: FontWeight.Regular,
    Height: 50,
    BackgroundColor: 'white'
  }
  private WeekTitleStyle = {
    FontColor: Color.Gray,
    FontSize: 15,
    FontWeight: FontWeight.Regular,
    Height: 15,
    BackgroundColor: 'white'
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
                .fontSize(this.TopTitleStyle.FontSize)
                .fontColor(this.TopTitleStyle.FontColor)
            }
            .onClick(() => {
              console.info('点击“回到今天”')
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
              .fontSize(this.TopTitleStyle.FontSize)
              .fontColor(this.TopTitleStyle.FontColor)
          }
          .onClick(() => {
            console.info('点击 “上个月"')
            this.swiperController.showPrevious()
          })
          .justifyContent(FlexAlign.Center)
          .width('20%')
          .height('100%')

          Row() {
            Text(this.titleMonth[0].toString() + "年" + this.titleMonth[1].toString() + "月")
              .fontSize(this.TopTitleStyle.FontSize)
              .fontColor(this.TopTitleStyle.FontColor)
          }
          .width('60%')
          .height('100%')
          .justifyContent(FlexAlign.Center)

          Row() {
            Text(">")
              .fontSize(this.TopTitleStyle.FontSize)
              .fontColor(this.TopTitleStyle.FontColor)
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
                .fontSize(this.TopTitleStyle.FontSize)
                .fontColor(this.TopTitleStyle.FontColor)
            }
            .onClick(() => {
              console.info('点击“完成”')
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
      .height(this.TopTitleStyle.Height)
      .backgroundColor(this.TopTitleStyle.BackgroundColor)

      // 星期标题区域
      Row() {
        ForEach(["日", "一", "二", "三", "四", "五", "六"], (item: string, index: number) => {
          Column() {
            Text(item)
              .fontColor(this.WeekTitleStyle.FontColor)
              .fontSize(this.WeekTitleStyle.FontSize)
              .fontWeight(this.WeekTitleStyle.FontWeight)
          }
          .layoutWeight(1)
          .height('100%')
        })
      }
      .width('100%')
      .height(this.WeekTitleStyle.Height)
      .backgroundColor(this.WeekTitleStyle.BackgroundColor)

      // 日期区域
      Column() {
        // Swiper实现试图的滑动切换，保存 上个月，当前月，下个月日期
        Swiper(this.swiperController) {
          LazyForEach(this.data, (item: string) => {
            Text(item)
              .width('90%')
              .height(160)
              .backgroundColor(0xAFEEEE)
              .textAlign(TextAlign.Center)
              .fontSize(30)
          }, item => item)
        }
        .cachedCount(2)
        .index(1)
        .interval(4000)
        .indicator(true)
        .loop(true)
        .duration(1000)
        .itemSpace(0)
        .curve(Curve.Linear)
        .onChange((index: number) => {
          console.info(index.toString())
        })

      }
      .backgroundColor("yellow")
      .height('80%')

      Column() {
        Button("sdd").onClick(()=>{
          console.info("sddsdd")
        }).height(30)

      }
    }
    .height('100%')
    .width('100%')
  }
}