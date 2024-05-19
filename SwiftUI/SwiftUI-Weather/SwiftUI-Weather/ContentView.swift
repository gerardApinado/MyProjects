//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Gerard on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    @ObservedObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                      temp: 76)
                
                HStack(spacing: 25)  {
                    ForEach(viewModel.items) { item in
                        WeatherDayView(dayOfWeek: item.dayOfWeek, imageName: item.imageName, temp: item.temp)
                    }
                }
                
                Spacer()
                
                Button {
                    // Action
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white )
                }
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40)
                .aspectRatio(contentMode: .fit)
            Text("\(temp)º")
                .foregroundStyle(.white)
                .font(.system(size: 28, weight: .medium))
        }
    }
}

struct BackgroundView: View {
    // the use of @Binding is if  you want to bind the variable to the @State variable to read and write
    // if you just want to read the @State var no need for @Binding keyword
    // just use $ symbol to access the @State var to the @Binding var
//    @Binding var isNight: Bool
    var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue,
                                                   isNight ? .gray : Color("lightBlue")]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
        .ignoresSafeArea(.all)
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temp: Int
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temp)º")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }
        .padding(.bottom, 40)
    }
}


