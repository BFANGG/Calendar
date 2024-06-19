// 获取month所在月份第一周周日的日期,即这个月日历第一天
export function getStartDate(month: number[]): number[] {
  // 创建一个日期对象，该对象表示给定年份和月份的第一天。avaScript 中的 Date 对象月份是从 0 开始的，所以减去 1。。
  var dateTime = new Date(month[0], month[1] - 1, 1);
  // 计算当前月视图第一周的周日日期
  // 6月1日周六，计算1号的6天前，就是这个月 月视图的第一周周日，也就是月视图上的第一天(周天在第一列)
  dateTime = new Date(dateTime.setDate(dateTime.getDate() - dateTime.getDay()));
  return [(dateTime.getFullYear()), (dateTime.getMonth() + 1), (dateTime.getDate())]
}


// 获取month对应的月份的上/下 n 个月的1号。
export function getNextNMonth(month: number[], n: number): number[] {
  var dateTime = new Date(month[0], month[1] - 1, 1);  //当前月1号日期
  dateTime = new Date(dateTime.setMonth(dateTime.getMonth() + n));
  return [(dateTime.getFullYear()), (dateTime.getMonth() + 1), (dateTime.getDate())]
}

/**
 * 获取下n天
 * @param date
 * @param n
 * @returns
 */
export function getNextNDay(date: number[], n: number): number[] {
  var dateTime = new Date(date[0], date[1] - 1, date[2]);
  dateTime = new Date(dateTime.setDate(dateTime.getDate() + n));
  return [(dateTime.getFullYear()), (dateTime.getMonth() + 1), (dateTime.getDate())]
}

export function getToday(): number[] {
  return [new Date().getFullYear(), new Date().getMonth() + 1, new Date().getDate()];
}