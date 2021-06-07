//
//  JobSelectionView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI
import MapKit

struct JobSelectionView: View {
    @State private var startedFinalDraw = false

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 0) {
                HStack(spacing: 10) {
                    RoulletteView(title: "Location", dataset: locationsDataSet, timeToResolveInSeconds: startedFinalDraw ? 30 : 10)
                        .frame(width: mainViewWidth * 0.40)
                        .offset(y: 26)

                    VStack {
                        RoulletteView(title: "Venue", dataset: venuesDataSet, timeToResolveInSeconds: startedFinalDraw ? 32 : 9)
                        RoulletteView(title: "Thing", dataset: thingDataSet, timeToResolveInSeconds: startedFinalDraw ? 36 : 4)
                        RoulletteView(title: "Time Limit", dataset: timeLimitDataset, timeToResolveInSeconds: startedFinalDraw ? 12 : 7)
                        RoulletteView(title: "Time of Day", dataset: timeOfDayDataset, timeToResolveInSeconds: startedFinalDraw ? 12 : 8)
                    }
                    .frame(width: mainViewWidth * 0.45)
                }
                .padding(.top, 40)

                Image("SonOfMan")
                    .resizable()
                    .frame(width: 115, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.bottom, 40)
                    .padding(.top, 20)
                    .opacity(startedFinalDraw ? 0.5 : 1)
                    .onTapGesture {
                        startedFinalDraw = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.25) {
                            // Allow for views to be recreated and resubscribe to listen.
                            NotificationCenter.default.post(name: startRoulleteShuffle, object: self)
                        }
                    }
            }
        }
        .colorScheme(.dark)
        .frame(width: mainViewWidth, height: 840, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct JobSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSelectionView()
    }
}
