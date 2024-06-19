import { BackgroundColor, ItemHeight, ItemSpace, DateStyle } from './consts'
import { getToday } from './tools'

@Component
export struct day {
  @Link selectDate: number[]
  //当前日组件日期
  @Prop showDate: number[] = []
  //当前日所属月组件的月份1号,用于将不属于该月的日期加灰。
  @Prop monthStart: number[]

  private getTextColor(): ResourceColor {
    //如果是今天，或者是选中日期，字体颜色为总背景颜色
    if (JSON.stringify(this.showDate) == JSON.stringify(this.selectDate)
      || JSON.stringify(this.showDate) == JSON.stringify(getToday())) {
      return BackgroundColor
    }
    else {
      //如果属于本月
      if (this.showDate[1] == this.monthStart[1])
        return DateStyle.FontColor.defaultColor
      //如果不属于本月
      return DateStyle.FontColor.unableColor
    }
  }

  private getBackgroundColor() {
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


  private changeSelectDate() {
    this.selectDate = this.showDate;
  }

  build() {
    Row() {
      Column() {
        Text(String(this.showDate[2]))
          .fontColor(this.getTextColor())
      }
      .width('100%')
    }
    .height('100%')
    .backgroundColor(this.getBackgroundColor())
    .border({
      width: DateStyle.BorderWidth,
      color: this.getBackgroundColor()
    })
    .borderRadius(ItemHeight / 2)
    .aspectRatio(1)
    .onClick(() => {
      if (this.showDate[1] == this.monthStart[1]){
        this.changeSelectDate()
      }
    })
  }
}