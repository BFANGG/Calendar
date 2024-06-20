import { getStartDate, getNextNDay } from './tools'
import { week } from './week'
import { BackgroundColor } from './consts';

@Component
export struct month {
  // 选中的日期
  // 父组件中@State, @StorageLink和@Link 和子组件@Link可以建立双向数据同步，反之亦然。
  @Link selectDate: number[]
  // 当前月组件要显示的月份的1号
  @Prop monthStart: number[] = [];
  //  一个月视图中的六周/五周，每个元素是每行行末日期
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
    //获取月视图第一天
    let temp = getStartDate(this.monthStart)
    this.data = new Array(5).fill([])
    // 用每行第一天填充data，填充前五行
    for (let i = 0; i < 5; i++)
      this.data[i] = getNextNDay(temp, i * 7)
    // 判断月视图第一天过五周35天后是否还是这个月，即第六行第一天是不是这个月，
    // 如果是，该月视图要显示6行
    if (getNextNDay(temp, 35)[1] == this.monthStart[1])
    //获取第六行第一天
      this.data.push(getNextNDay(temp, 35));
    // 判断当前选择日期处于哪个周
    for (let i = 0; i < this.data.length; i++)
      if (!this.checkSelectDay(this.data[i])) {
        break;
      }
  }

  // 判断以weekStartDate开始的一周中有没有选中的那天
  private checkSelectDay(weekStartDate: number[]): boolean {
    for (let i = 0; i < 6; i++) {
      let temp: number[] = getNextNDay(weekStartDate, i)
      if (temp[1] == this.selectDate[1] && temp[2] == this.selectDate[2])
        return true
    }
    return false
  }

  build() {
    Stack() {
      Column() {
        ForEach(this.data, (item: number[], index: number) => {
          Column() {
            week({
              selectDate: $selectDate,
              weekStart: item,
              monthStart: this.monthStart,
              showOtherMonth: this.showOtherMonth,
              ItemHeight:this.ItemHeight,
              selectColor:this.selectColor,
              todayColor:this.todayColor
            }
            )
          }
          .height(this.ItemHeight)
          .width('100%')
        })
      }
    }
  }
}

