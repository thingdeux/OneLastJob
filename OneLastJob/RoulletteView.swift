//
//  ContentView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI

let mainViewWidth: CGFloat = 740.0

struct RoulletteView: View {
    @ObservedObject private var viewModel: RoulletteViewModel

    init(title: String,
         dataset: [String] = [],
         timeToResolveInSeconds: Double = 5) {
        viewModel = RoulletteViewModel(title: title, dataset: dataset, timeToResolveInSeconds: timeToResolveInSeconds)
    }

    var body: some View {
        VStack(spacing: 0) {
            Text(viewModel.title)
                .fontWeight(.semibold)
                .font(.system(size: 60))

            Text(viewModel.value)
                .foregroundColor(viewModel.textColor)
                .fontWeight(.thin)
                .font(.system(size: 40))
                .frame(width: mainViewWidth)
        }
        .onTapGesture {
            viewModel.startRoullette()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RoulletteView(title: "Location")
    }
}
