
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




export interface TitleStyle {
  FontColor: ResourceColor,
  FontSize: Length,
  FontWeight: FontWeight,
  Height: Length
  BackgroundColor: ResourceColor
}


