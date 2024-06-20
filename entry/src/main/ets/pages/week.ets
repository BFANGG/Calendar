import { getNextNDay } from './tools'
import { day } from './day'

@Component
export struct week {
  @Link selectDate: number[]
  // 当前周组件要显示的周(第一天)
  @Prop weekStart: number[] = []
  //当前周所属月组件的月份1号,用于将不属于该月的日期加灰。
  @Prop monthStart: number[]
  // 父组件中@State如果装饰的数组，其数组项也可以初始化@Prop。
  // 当前周组件要渲染的周数据
  @State data: number[][] = []
  //----------样式控制属性----------
  //是否显示其它月日期
  private showOtherMonth: boolean
  // 每行高度,默认为50
  private ItemHeight: number
  // 选中日期的颜色
  private selectColor:ResourceColor
  // 今天的颜色
  private todayColor:ResourceColor
  aboutToAppear() {
    console.info("执行 aboutToAppear")
    // 一周七天
    this.data = new Array(7).fill([])
    for (let i = 0; i <= 6; i++) {
      let day = getNextNDay(this.weekStart, i)
      console.log(String(day[1]) + String(day[2]))
      this.data[i] = day
    }
  }

  build() {
    Row() {
      ForEach(this.data, (item: number[], index: number) => {
        Row() {
          day({
            selectDate: $selectDate,
            showDate: item,
            monthStart: this.monthStart,
            showOtherMonth: this.showOtherMonth,
            ItemHeight: this.ItemHeight,
            selectColor:this.selectColor,
            todayColor:this.todayColor
          })
        }
        .height('100%')
        .layoutWeight(1)
      })
    }
    .height('100%')
    .width('100%')
  }
}