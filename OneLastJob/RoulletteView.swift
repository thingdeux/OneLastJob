//
//  ContentView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI
import MapKit

let mainViewWidth: CGFloat = 1400.0

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
            Text(viewModel.title.uppercased())
                .fontWeight(.bold)
                .font(.system(size: 50))

            Text(viewModel.value.text)
                .foregroundColor(viewModel.textColor)
                .fontWeight(.thin)
                .lineLimit(1)
                .font(.system(size: 38))
                .padding([.bottom], shouldShowMap ? 15 : 0)

            ZStack {
                viewModel.textColor
                    .opacity(shouldShowMap ? 0.5 : 0)
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

extension Array where Element == String {
    func asRoulletteData() -> [RoulletteView.Data] {
        return self.compactMap { string in
            RoulletteView.Data(text: string)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RoulletteView(title: "Location")
    }
}
