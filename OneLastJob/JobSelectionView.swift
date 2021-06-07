//
//  JobSelectionView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI
import MapKit

struct JobSelectionView: View {
    var body: some View {
        ScrollView {
            VStack(spacing: 15) {
                RoulletteView(title: "Location", dataset: locationsDataSet, timeToResolveInSeconds: 10)
                    .padding(.top, 90)

                RoulletteView(title: "Venue", dataset: venuesDataSet, timeToResolveInSeconds: 20)
                RoulletteView(title: "Thing", dataset: thingDataSet, timeToResolveInSeconds: 45)
                RoulletteView(title: "Time Limit", dataset: timeLimitDataset, timeToResolveInSeconds: 8)
                RoulletteView(title: "Time of Day", dataset: timeOfDayDataset, timeToResolveInSeconds: 5)
                    .padding(.bottom, 40)

            }
        }

        .colorScheme(.dark)
        .frame(width: mainViewWidth, height: 1200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct JobSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSelectionView()
    }
}
