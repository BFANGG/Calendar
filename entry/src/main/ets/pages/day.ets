import { BackgroundColor, DateStyle } from './consts'
import { getToday } from './tools'

@Component
export struct day {
  @Link selectDate: number[]
  //当前日组件日期
  @Prop showDate: number[] = []
  //当前日所属月组件的月份1号,用于将不属于该月的日期加灰。
  @Prop monthStart: number[]

  //----------样式控制属性----------
  //是否显示其它月日期
  private showOtherMonth: boolean
  // 每行高度,默认为50
  private ItemHeight: number

  private getTextColor(): ResourceColor {
    // 属于本月
    if (this.showDate[1] == this.monthStart[1]) {
      //且，如果是今天，或者是选中日期，字体颜色为总背景颜色
      if (JSON.stringify(this.showDate) == JSON.stringify(this.selectDate)
        || JSON.stringify(this.showDate) == JSON.stringify(getToday())) {
        return BackgroundColor
      }
    }
    // 不属于本月
    else {
      //如果设定为显示不属于本月的日期
      if (this.showOtherMonth)
        return DateStyle.FontColor.unableColor
      // 否则和背景颜色一样，即隐形
      else
        return BackgroundColor
    }
  }

  private getBackgroundColor() {
    //属于本月
    if (this.showDate[1] == this.monthStart[1]) {
      // 如果是选中的日期
      if (JSON.stringify(this.showDate) == JSON.stringify(this.selectDate)) {
        return DateStyle.BackgroundColor.selectColor
      }
      // 如果是今天
      else if (JSON.stringify(this.showDate) == JSON.stringify(getToday())) {
        return DateStyle.BackgroundColor.todayColor
      }
      else return BackgroundColor
    }
    //不属于本月的即使是选中日期或者今天 都不显示 字体颜色和背景颜色一样
    else return BackgroundColor
  }

  private changeSelectDate() {
    this.selectDate = this.showDate;
  }

  build() {
    Row() {
      Column() {
        if (JSON.stringify(this.showDate) == JSON.stringify(getToday())) {
          Text(String("今"))
            .fontColor(this.getTextColor())
        }
        else {
          Text(String(this.showDate[2]))
            .fontColor(this.getTextColor())
        }
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(this.getBackgroundColor())
    .border({
      width: DateStyle.BorderWidth,
      color: this.getBackgroundColor()
    })
    .borderRadius(this.ItemHeight / 2)
    .aspectRatio(1)
    .onClick(() => {
      if (this.showDate[1] == this.monthStart[1]) {
        this.changeSelectDate()
      }
    })
  }
}