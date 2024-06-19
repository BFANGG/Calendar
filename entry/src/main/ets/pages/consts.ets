
interface DateStyle {
  FontColor: {
    defaultColor: ResourceColor,
    unableColor: ResourceColor
  },
  BackgroundColor: {
    selectColor: ResourceColor,
    todayColor: ResourceColor
  },
  FontSize: Length,
  FontWeight: FontWeight,
  BorderWidth: Length
}

export const DateStyle: DateStyle = {
  FontColor: {
    defaultColor: Color.Black,
    unableColor: Color.Gray
  },
  BackgroundColor: {
    selectColor: Color.Blue,
    todayColor: "#ADD8E6"
  },
  FontSize: 22,
  FontWeight: FontWeight.Bold,
  BorderWidth: 1
}

export const BackgroundColor: ResourceColor = Color.White

export const ItemHeight: number = 50

export const ItemSpace: string | number = 15


export interface TitleStyle {
  FontColor: ResourceColor,
  FontSize: Length,
  FontWeight: FontWeight,
  Height: Length
  BackgroundColor: ResourceColor
}

export const TopTitleStyle: TitleStyle = {
  FontColor: "#252a34",
  FontSize: 15,
  FontWeight: FontWeight.Regular,
  Height: 50,
  BackgroundColor: 'white'
}
export const WeekTitleStyle :TitleStyle = {
  FontColor: Color.Gray,
  FontSize: 15,
  FontWeight: FontWeight.Regular,
  Height: 15,
  BackgroundColor: 'white'
}

