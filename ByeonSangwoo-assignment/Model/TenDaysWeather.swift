//
//  TenDaysWeather.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/10/23.
//

import Foundation

struct TenDaysWeather {
    let day: String
    let weatherIconImage: String
    let predictPercent: String?
    let tempMin: String
    let tempImage: String
    let tempMax: String
}

let tenDaysWeatherDummyData: [TenDaysWeather] = [
    TenDaysWeather(day: "오늘", weatherIconImage: "sun.max.fill", predictPercent: nil, tempMin: "-1°", tempImage: "temp1", tempMax: "9°"),
    TenDaysWeather(day: "월", weatherIconImage: "cloud.rain.fill", predictPercent: "50%", tempMin: "-3°", tempImage: "temp2", tempMax: "5°"),
    TenDaysWeather(day: "화", weatherIconImage: "sun.max.fill", predictPercent: nil, tempMin: "-4°", tempImage: "temp3", tempMax: "5°"),
    TenDaysWeather(day: "수", weatherIconImage: "cloud.rain.fill", predictPercent: "20%", tempMin: "-1°", tempImage: "temp4", tempMax: "7°"),
    TenDaysWeather(day: "목", weatherIconImage: "cloud.rain.fill", predictPercent: "50%", tempMin: "-4°", tempImage: "temp5", tempMax: "9°"),
    TenDaysWeather(day: "금", weatherIconImage: "cloud.rain.fill", predictPercent: "40%", tempMin: "-5°", tempImage: "temp6", tempMax: "12°"),
    TenDaysWeather(day: "토", weatherIconImage: "sun.max.fill", predictPercent: nil, tempMin: "-8°", tempImage: "temp7", tempMax: "9°"),
    TenDaysWeather(day: "일", weatherIconImage: "sun.max.fill", predictPercent: nil, tempMin: "-3°", tempImage: "temp8", tempMax: "10°"),
    TenDaysWeather(day: "월", weatherIconImage: "cloud.rain.fill", predictPercent: "20%", tempMin: "-3°", tempImage: "temp9", tempMax: "11°"),
    TenDaysWeather(day: "화", weatherIconImage: "cloud.rain.fill", predictPercent: "40%", tempMin: "-5°", tempImage: "temp10", tempMax: "16°"),
    TenDaysWeather(day: "수", weatherIconImage: "sun.max.fill", predictPercent: nil, tempMin: "-7°", tempImage: "temp11", tempMax: "10°")
]
