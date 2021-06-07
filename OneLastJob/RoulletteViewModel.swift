//
//  RoulletteViewModel.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import Foundation
import Combine
import SwiftUI

class RoulletteViewModel: ObservableObject  {
    @Published private(set) var title: String
    @Published private(set) var textColor = Color.white
    private(set) var dataset: [String] = []
    private(set) var resolveTime: Double = 5
    private var animationTimeElapsed: TimeInterval = 0

    init(title: String,
         dataset: [String] = [],
         timeToResolveInSeconds: Double = 5) {

        self.title = title
        let randomInsertions = Int.random(in: 50..<100)
        for _ in 0..<randomInsertions {
            self.dataset.append(contentsOf: dataset.shuffled())
        }
        resolveTime = timeToResolveInSeconds
    }

    private var animationTimer: AnyCancellable?
    func startRoullette() {
        self.animationTimeElapsed = 0
        self.textColor = Color.white
        let animationSpeed: TimeInterval = 0.10

        animationTimer =
            Timer.publish(every: animationSpeed, on: .main, in: .common)
            .autoconnect()
            .sink() { [weak self]_ in
                guard let self = self else { return }
                guard self.animationTimeElapsed < self.resolveTime else {
                    print("IT'S A WRAP!!")
                    self.textColor = Color.red
                    self.animationTimer?.cancel()
                    return
                }

                self.animationTimeElapsed += animationSpeed

                // I want each change to linger a bit
                withAnimation(.easeOut(duration: animationSpeed - 0.25)) {
                    self.title = "     "
                }

                withAnimation(.easeIn(duration: animationSpeed - 0.5)) {
                    self.title = self.dataset.randomElement() ?? ""
                }
                print(self.animationTimeElapsed)
            }
    }
}