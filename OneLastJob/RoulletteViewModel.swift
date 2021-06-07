//
//  RoulletteViewModel.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import Foundation
import Combine
import SwiftUI
import MapKit

let startRoulleteShuffle = Notification.Name(rawValue: "StartReshuffle")

class RoulletteViewModel: ObservableObject  {
    @Published private(set) var title: String
    @Published private(set) var textColor = Color.white
    @Published private(set) var currentlyResolving = false
    @Published private(set) var value: RoulletteView.Data = RoulletteView.Data(text: "  - -  ")
    @Published var region = Constants.defaultRegion

    private(set) var dataset: [RoulletteView.Data] = []
    private(set) var resolveTime: Double = 5
    private var animationTimeElapsed: TimeInterval = 0
    private var processedFinal = false

    // Combine subscribers
    private var animationTimer: AnyCancellable?
    private var shuffleAllReceiver: AnyCancellable?

    private enum Constants {
        static let defaultRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275),
                                                      span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))
    }

    init(title: String,
         dataset: [RoulletteView.Data] = [],
         timeToResolveInSeconds: Double = 5) {

        self.title = title
        let randomInsertions = Int.random(in: 50..<100)
        for _ in 0..<randomInsertions {
            self.dataset.append(contentsOf: dataset.shuffled())
        }
        resolveTime = timeToResolveInSeconds
        shuffleAllReceiver = NotificationCenter.default
            .publisher(for: startRoulleteShuffle)
            .sink(receiveValue: { [weak self] _ in
                self?.startRoullette()
                self?.processedFinal = true
            })
    }

    deinit {
        self.animationTimer?.cancel()
        self.shuffleAllReceiver?.cancel()
        self.animationTimer = nil
        self.shuffleAllReceiver = nil
    }

    func startRoullette() {
        guard processedFinal == false else { return }

        let isLocationView: Bool = self.dataset.first?.type == .location
        self.animationTimeElapsed = 0
        self.textColor = Color.white
        let animationSpeed: TimeInterval = isLocationView ? 0.80 : 0.10
        currentlyResolving = true

        animationTimer =
            Timer.publish(every: animationSpeed, on: .main, in: .common)
            .autoconnect()
            .sink() { [weak self]_ in
                guard let self = self else { return }
                guard self.animationTimeElapsed < self.resolveTime else {                    
                    self.textColor = self.processedFinal ? Color.green : Color.red
                    self.currentlyResolving = false
                    self.animationTimer?.cancel()
                    return
                }

                let data = self.dataset.randomElement() ?? RoulletteView.Data(text: "")

                self.animationTimeElapsed += animationSpeed
                // I want each change to linger a bit
                withAnimation(.easeOut(duration: animationSpeed - 0.25)) {
                    self.value = RoulletteView.Data(text: "     ",
                                                    type: data.type,
                                                    associatedLocation: data.associatedLocation)
                }

                if (!isLocationView) {
                    withAnimation(.easeIn(duration: animationSpeed - 0.5)) { self.value = data }
                } else {
                    DispatchQueue.main.async {
                        self.region = data.associatedLocation ?? Constants.defaultRegion
                        withAnimation(.easeIn(duration: animationSpeed - 0.5)) {
                            self.value = data
                        }
                    }
                }
            }
    }
}
