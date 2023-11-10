//
//  Weather.swift
//  ByeonSangwoo-assignment
//
//  Created by 변상우 on 11/9/23.
//

import Foundation

struct Weather {
    let title: String
    let subTitle: String
    let temperature: String
    let weather: String
    let tempMaxMin: String
    let weatherImage: String
}

let dummyData: [Weather] = [
    Weather(title: "나의 위치", subTitle: "서울특별시", temperature: "9°", weather: "흐림", tempMaxMin: "최고:9° 최저:-1°", weatherImage: "cellBackground"),
    Weather(title: "노원구", subTitle: "오전 12:02", temperature: "9°", weather: "흐림", tempMaxMin: "최고:9° 최저:-1°", weatherImage: "cellBackground"),
    Weather(title: "청주시", subTitle: "오전 12:02", temperature: "12°", weather: "흐림", tempMaxMin: "최고:12° 최저:-1°", weatherImage: "cellBackground"),
    Weather(title: "제주특별자치도", subTitle: "오전 12:02", temperature: "14°", weather: "비", tempMaxMin: "최고:14° 최저:6°", weatherImage: "cellBackground"),
    Weather(title: "뉴캐슬어폰타인", subTitle: "오후 3:02", temperature: "8°", weather: "부분적으로 흐림", tempMaxMin: "최고:8° 최저:3°", weatherImage: "cellBackground"),
]
