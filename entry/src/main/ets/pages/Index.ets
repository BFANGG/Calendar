import { calendar } from './calendar'
import { getToday } from './tools'

@Entry
@Preview
@Component
struct Index {
  @State message: string = 'Hello World';
  private selectDate: number[];

  private onFinish() {
    console.info("点击 完成 要做的事件")
  }

  build() {
    Column() {
      calendar({
        selectDate: getToday(),
        onFinish: this.onFinish(),
        onSelect: (date: number[]) => {
          console.info(String(date[0]) + String(date[1]) + String(date[2]))
          //在日期这里触发一个日期选中事件，就可以得到选中日期
        }
      }
      )
    }.width('100%')
    .height('100%')
  }
}