//
//  ContentView.swift
//  WeatherApp
//
//  Created by on 11/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight = false
    var body: some View {
        ZStack{
            backgroundView(isNight: $isNight)
            
              
                
                //extracted sub view
                VStack(spacing : 8){
                    CityTextView(cityNmae: "Maharashtra, MH")
                    MainWeatherStatusView(Imge: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                          temp: isNight ? 12 : 30)
 
                
                HStack(spacing : 20){
                 WeatherDayView(dayOfWeek: "TUE",
                                imgname: "cloud.sun.fill",
                                temp: 22)
                    WeatherDayView(dayOfWeek: "THU",
                                   imgname: "sun.rain.fill",
                                   temp: 16)
                    WeatherDayView(dayOfWeek: "WED",
                                   imgname: "cloud.drizzle.fill",
                                   temp: 19)
                    WeatherDayView(dayOfWeek: "FRI",
                                   imgname: "sun.max.fill",
                                   temp: 40)
                    WeatherDayView(dayOfWeek: "SAT",
                                   imgname: "cloud.moon.fill",
                                   temp: 9)
                }
                    Spacer()
                Button{
                    isNight.toggle()
                } label:{
                    weatherBtn(title: isNight ? "Change Night Time" : "Change Day Time",
                               textColor: isNight ? .black : .blue,
                               bgColor: .white)
                }
                Spacer()
              
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView : View {
    var dayOfWeek : String
    var imgname : String
    var temp: Int
    
    var body: some View {
        VStack{
            Text(dayOfWeek)
                .font(.system(size: 16,weight: .medium,design: .default))
                .foregroundStyle(.white)
            Image(systemName: imgname)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40,height: 40)
            Text("\(temp)°")
                .font(.system(size:28,weight: .medium))
                .foregroundStyle(.white)
            
        }
    }
}

struct backgroundView : View {
   @Binding var isNight :Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [ isNight ? .black : .blue,
                                          isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView : View {
    var cityNmae : String
    var body: some View {
        Text(cityNmae)
            .font(.system(size: 34,weight: .medium,design: .default))
            .foregroundStyle(.white)
            .padding()

    }
}

struct MainWeatherStatusView : View {
    var Imge :String
    var temp : Int
    
    var body: some View {
        VStack(spacing: 10){
            
            
            Image(systemName: Imge)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180,height: 180)
            Text("\(temp)°")
                .font(.system(size: 70,weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom,50)
    }
    
}

