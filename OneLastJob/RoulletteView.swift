//
//  ContentView.swift
//  OneLastJob
//
//  Created by Joshua Johnson on 6/6/21.
//

import SwiftUI

let mainViewWidth: CGFloat = 600.0

struct RoulletteView: View {
    @ObservedObject private var viewModel: RoulletteViewModel

    init(title: String,
         dataset: [String] = [],
         timeToResolveInSeconds: Double = 20) {
        viewModel = RoulletteViewModel(title: title, dataset: dataset, timeToResolveInSeconds: timeToResolveInSeconds)
    }

    var body: some View {
        Text(viewModel.title)
            .foregroundColor(viewModel.textColor)
            .fontWeight(.heavy)
            .font(.system(size: 50))
            .frame(width: mainViewWidth)
            .onTapGesture {
                viewModel.startRoullette()
            }


//        ScrollViewReader { proxy in
//            ScrollView(.horizontal, showsIndicators: false) {
//                LazyHStack {
//                    Text(viewModel.title)
//                        .foregroundColor(Color.white)
//                        .fontWeight(.heavy)
//                        .font(.system(size: 50))
//                        .frame(width: mainViewWidth)
//                        .id(-200)
//
//                    DatasetView(dataSet: viewModel.dataset)
//                }
//                .onTapGesture() {
//                    withAnimation(.easeInOut(duration: viewModel.resolveTime * 1000)) {
//                        proxy.scrollTo(Int.random(in: 0..<viewModel.dataset.count), anchor: .center)
//                    }
//                }
//            }
//        }
    }
}

fileprivate struct DatasetView: View {
    var dataSet: [String] = []

    var body: some View {
        ForEach(0..<dataSet.count) { i in
            Text(dataSet[i])
                .foregroundColor(Color.white)
                .fontWeight(.heavy)
                .font(.system(size: 50))
                .frame(width: mainViewWidth, height: 200)
                .id(i)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RoulletteView(title: "Location")
    }
}
