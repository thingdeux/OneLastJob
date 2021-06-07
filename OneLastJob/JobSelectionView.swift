//
//  JobSelectionView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI
import MapKit

struct JobSelectionView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1))

    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                RoulletteView(title: "Location", dataset: locationsDataSet, timeToResolveInSeconds: 10)
                    .padding(.top, 40)

                Map(coordinateRegion: $region)
                    .frame(width: 500, height: 400)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding()


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
