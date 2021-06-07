//
//  JobSelectionView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI
import MapKit

private var startedFinalDraw = false

struct JobSelectionView: View {

    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                RoulletteView(title: "Location", dataset: locationsDataSet, timeToResolveInSeconds: startedFinalDraw ? 25 : 10)
                    .padding(.top, 40)

                RoulletteView(title: "Venue", dataset: venuesDataSet, timeToResolveInSeconds: startedFinalDraw ? 28 : 9)
                RoulletteView(title: "Thing", dataset: thingDataSet, timeToResolveInSeconds: startedFinalDraw ? 40 : 4)
                RoulletteView(title: "Time Limit", dataset: timeLimitDataset, timeToResolveInSeconds: startedFinalDraw ? 12 : 7)
                RoulletteView(title: "Time of Day", dataset: timeOfDayDataset, timeToResolveInSeconds: startedFinalDraw ? 12 : 8)

                Image("SonOfMan")
                    .resizable()
                    .frame(width: 115, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.bottom, 40)
                    .onTapGesture {
                        startedFinalDraw = true
                        NotificationCenter.default.post(name: startRoulleteShuffle, object: self)
                    }
            }
        }
        .colorScheme(.dark)
        .frame(width: mainViewWidth, height: 1300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct JobSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSelectionView()
    }
}
