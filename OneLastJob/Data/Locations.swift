//
//  Locations.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import Foundation
import MapKit

private enum Constants {


    static let LasVegasLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 36.169941, longitude: -115.139832),
                                                     span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))


    static let ParisFranceLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 48.856613, longitude: 2.352222),
                                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let LondonEnglandLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507351, longitude: -0.127758),
                                                          span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let MoscowRussiaLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: 37.617298),
                                                         span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    static let HongKongChinaLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 22.396427, longitude: 114.109497),
                                                          span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.5))

    static let LongBeachLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.77052726087185, longitude: -118.19696518315402),
                                                      span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let LosAngelesLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 34.05384047846691, longitude: -118.24294052176013),
                                                       span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let NewYorkLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.71249884628397, longitude: -73.99959784104185),
                                                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let BangkokLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 13.82087444354344, longitude: 100.57017469936255),
                                                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    static let DubaiLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 25.147933926269967, longitude: 55.17832339189459),
                                                  span: MKCoordinateSpan(latitudeDelta: 0.4, longitudeDelta: 0.4))

    static let RomeLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.902895453021785, longitude: 12.494454826165699),
                                                 span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let DelhiIndiaLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 28.629671569612047, longitude: 77.10851146020083),
                                                       span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    static let TokyoJapanLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 35.682725782328596, longitude: 139.76764577888122),
                                                       span: MKCoordinateSpan(latitudeDelta: 0.3, longitudeDelta: 0.3))

    static let MadridSpainLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 40.42173024162974, longitude: -3.703570282427399),
                                                        span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let ChicagoLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 41.785346429667406, longitude: -87.75393762966097),
                                                    span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    static let SeattleLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 47.61902438067194, longitude: -122.34687196913775),
                                                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    static let SydneyAustraliaLocation = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: -33.93967355524115, longitude: 151.1753193142821),
                                                            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
}

let locationsDataSet: [RoulletteView.Data] = [
    RoulletteView.Data(text: "Las Vegas, USA", type: .location, associatedLocation: Constants.LasVegasLocation),
    RoulletteView.Data(text: "Paris, France", type: .location, associatedLocation: Constants.ParisFranceLocation),
    RoulletteView.Data(text: "London, England", type: .location, associatedLocation: Constants.LondonEnglandLocation),
    RoulletteView.Data(text: "Moscow, Russia", type: .location, associatedLocation: Constants.MoscowRussiaLocation),
    RoulletteView.Data(text: "Hong Kong, China", type: .location, associatedLocation: Constants.HongKongChinaLocation),
    RoulletteView.Data(text: "Long Beach, USA", type: .location, associatedLocation: Constants.LongBeachLocation),
    RoulletteView.Data(text: "Los Angeles, USA", type: .location, associatedLocation: Constants.LosAngelesLocation),
    RoulletteView.Data(text: "New York, USA", type: .location, associatedLocation: Constants.NewYorkLocation),
    RoulletteView.Data(text: "Bangkok, Thailand", type: .location, associatedLocation: Constants.BangkokLocation),
    RoulletteView.Data(text: "Dubai, UAE", type: .location, associatedLocation: Constants.DubaiLocation),
    RoulletteView.Data(text: "Rome, Italy", type: .location, associatedLocation: Constants.RomeLocation),
    RoulletteView.Data(text: "Delhi, India", type: .location, associatedLocation: Constants.DelhiIndiaLocation),
    RoulletteView.Data(text: "Tokyo, Japan", type: .location, associatedLocation: Constants.TokyoJapanLocation),
    RoulletteView.Data(text: "Madrid, Spain", type: .location, associatedLocation: Constants.MadridSpainLocation),
    RoulletteView.Data(text: "Chicago, United States", type: .location, associatedLocation: Constants.ChicagoLocation),
    RoulletteView.Data(text: "Seattle, USA", type: .location, associatedLocation: Constants.SeattleLocation),
    RoulletteView.Data(text: "Sydney, Australia", type: .location, associatedLocation: Constants.SydneyAustraliaLocation)
]
