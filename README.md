# HarmonyOS Calendar
## 移动应用课程设计
##  API
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
// Swiper属性，设置子组件与子组件之间间隙, 默认:15  
private ItemSpace: string | number = 15  
// 每行高度,默认为50  
private ItemHeight: number = 50  
// 标题通用样式设置  
interface TitleStyle {  
FontColor: ResourceColor,  
FontSize: Length,  
FontWeight: FontWeight,  
Height: Length  
BackgroundColor: ResourceColor  
}  
