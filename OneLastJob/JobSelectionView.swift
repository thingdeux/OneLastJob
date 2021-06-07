//
//  JobSelectionView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI
import MapKit

struct JobSelectionView: View {
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

    var body: some View {
        VStack {
            RoulletteView(title: "Location")
            RoulletteView(title: "Venue")
            RoulletteView(title: "Thing")
            RoulletteView(title: "Time Limit", dataset: timeLimitDataset)
            RoulletteView(title: "Time of Day", dataset: timeOfDayDataset)

//            Map(coordinateRegion: $region)
//                .frame(width: 500, height: 400)
//                .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
//                .padding()

            Button("One Last Job") {
                print("Shuffle")
            }
            .frame(width: 100, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .foregroundColor(.primary)            
            .cornerRadius(5)

        }
        .colorScheme(.dark)
        .frame(width: mainViewWidth, height: 1020, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
    }
}

struct JobSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        JobSelectionView()
    }
}
