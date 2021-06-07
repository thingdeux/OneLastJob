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
            VStack(spacing: 20) {
                RoulletteView(title: "Location", dataset: locationsDataSet, timeToResolveInSeconds: 10)
                    .padding(.top, 90)

                RoulletteView(title: "Venue", dataset: venuesDataSet, timeToResolveInSeconds: 20)
                RoulletteView(title: "Thing", dataset: thingDataSet, timeToResolveInSeconds: 35)
                RoulletteView(title: "Time Limit", dataset: timeLimitDataset, timeToResolveInSeconds: 10)
                RoulletteView(title: "Time of Day", dataset: timeOfDayDataset, timeToResolveInSeconds: 10)

                Image("SonOfMan")
                    .resizable()
                    .frame(width: 115, height: 150, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 30))
                    .padding(.bottom, 40)
                    .onTapGesture {
                        NotificationCenter.default.post(name: startRoulleteShuffle, object: nil)
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
