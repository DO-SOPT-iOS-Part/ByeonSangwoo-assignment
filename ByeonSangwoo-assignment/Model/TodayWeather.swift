//
//  TodayWeather.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/10/23.
//

import Foundation

struct TodayWeather {
    let time: String
    let weatherImage: String
    let temperature: String
}

let todayWeatherDummyData: [TodayWeather] = [
    TodayWeather(time: "Now", weatherImage: "cloud.bolt.fill", temperature: "3°"),
    TodayWeather(time: "11시", weatherImage: "cloud.sun.fill", temperature: "4°"),
    TodayWeather(time: "12시", weatherImage: "cloud.heavyrain.fill", temperature: "5°"),
    TodayWeather(time: "1시", weatherImage: "cloud.bolt.fill", temperature: "6°"),
    TodayWeather(time: "2시", weatherImage: "cloud.heavyrain.fill", temperature: "7°"),
    TodayWeather(time: "3시", weatherImage: "cloud.bolt.fill", temperature: "7°"),
    TodayWeather(time: "4시", weatherImage: "cloud.bolt.fill", temperature: "6°"),
    TodayWeather(time: "5시", weatherImage: "cloud.fill", temperature: "5"),
    TodayWeather(time: "6시", weatherImage: "cloud.bolt.fill", temperature: "4°"),
    TodayWeather(time: "7시", weatherImage: "cloud.fill", temperature: "3°"),
    TodayWeather(time: "8시", weatherImage: "cloud.bolt.fill", temperature: "1°"),
    TodayWeather(time: "9시", weatherImage: "cloud.bolt.fill", temperature: "0°"),
    TodayWeather(time: "10시", weatherImage: "cloud.fill", temperature: "0°"),
    TodayWeather(time: "11시", weatherImage: "cloud.heavyrain.fill", temperature: "-1°"),
    TodayWeather(time: "12시", weatherImage: "cloud.bolt.fill", temperature: "-2°"),
    TodayWeather(time: "1시", weatherImage: "cloud.bolt.fill", temperature: "-2°"),
    TodayWeather(time: "2시", weatherImage: "cloud.bolt.fill", temperature: "-3°"),
    TodayWeather(time: "3시", weatherImage: "cloud.sun.fill", temperature: "-3°"),
    TodayWeather(time: "4시", weatherImage: "cloud.bolt.fill", temperature: "-3°"),
    TodayWeather(time: "5시", weatherImage: "cloud.sun.fill", temperature: "-3°"),
    TodayWeather(time: "6시", weatherImage: "cloud.sun.fill", temperature: "-2°"),
    TodayWeather(time: "7시", weatherImage: "cloud.sun.fill", temperature: "0°"),
    TodayWeather(time: "8시", weatherImage: "cloud.bolt.fill", temperature: "1°"),
    TodayWeather(time: "9시", weatherImage: "cloud.sun.fill", temperature: "2°"),
]
