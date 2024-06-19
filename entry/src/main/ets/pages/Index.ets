import { calendar } from './calendar'

@Entry
@Preview
@Component
struct Index {
  @State message: string = 'Hello World';

  private onFinish() {
    console.info("点击 完成 要做的事件")
  }

  build() {
    Column() {
      calendar({ onFinish: this.onFinish() })
    }.width('100%')
    .height('100%')
  }
}