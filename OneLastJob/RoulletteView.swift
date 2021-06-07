//
//  ContentView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI
import MapKit

let mainViewWidth: CGFloat = 740.0

struct RoulletteView: View {
    @ObservedObject private var viewModel: RoulletteViewModel
    private var shouldShowMap: Bool {
        return viewModel.value.type == .location
    }

    init(title: String,
         dataset: [RoulletteView.Data] = [],
         timeToResolveInSeconds: Double = 5) {
        viewModel = RoulletteViewModel(title: title, dataset: dataset, timeToResolveInSeconds: timeToResolveInSeconds)
    }

    var body: some View {
        VStack(spacing: 0) {
            Text(viewModel.title)
                .fontWeight(.semibold)
                .font(.system(size: 60))

            Text(viewModel.value.text)
                .foregroundColor(viewModel.textColor)
                .fontWeight(.thin)
                .font(.system(size: 40))
                .frame(width: mainViewWidth)
                .padding([.bottom], shouldShowMap ? 15 : 0)

            ZStack {
                Color.white.opacity(shouldShowMap ? 1 : 0)
                Map(coordinateRegion: $viewModel.region)
                    .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
                    .padding(4)
            }
            .cornerRadius(/*@START_MENU_TOKEN@*/3.0/*@END_MENU_TOKEN@*/)
            .padding([.top, .bottom], shouldShowMap ? 15 : 0)
            .frame(width: shouldShowMap ? 500 : 0, height: shouldShowMap ? 400 : 0)
        }
        .onTapGesture {
            viewModel.startRoullette()
        }
    }

    struct Data {
        var text: String
        var type: Data.StorageType = .text
        var associatedLocation: MKCoordinateRegion? = nil

        enum StorageType {
            case text
            case location
        }
    }
}

extension String {
    func asRoulletteData() -> RoulletteView.Data {
        return RoulletteView.Data(text: self)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RoulletteView(title: "Location")
    }
}
