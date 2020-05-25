//
//  ContentView.swift
//  NavigationLinkBug
//
//  Created by Majid Jabrayilov on 5/26/20.
//  Copyright © 2020 Majid Jabrayilov. All rights reserved.
//
import SwiftUI

final class Store: ObservableObject {
    @Published var messages: [String] = ["Hello", "World"]
}

struct MessagesCountView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        Text("message count: \(store.messages.count)")
    }
}

struct DestinationView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        List(store.messages, id: \.self) { message in
            Text(message)
        }
    }
}

struct ContentView: View {
    var body: some View {
        NavigationView {
            NavigationLink(destination: DestinationView()) {
                MessagesCountView()
            }.environmentObject(Store())
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
