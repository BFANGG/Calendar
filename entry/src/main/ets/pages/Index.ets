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
        // selectDate: getToday(),
        onFinish: (date: number[]) => {
          console.info(String(date[0]) + String(date[1]) + String(date[2]))
          //在日期这里触发一个日期选中事件，就可以得到选中日期
          //在这里可以处理点击完成后的事件，比如获取selectDate值或者返回等操作
        }
      }
      )
    }.width('100%')
    .height('100%')
  }
}