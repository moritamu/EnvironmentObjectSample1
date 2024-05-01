//
//  ContentView.swift
//  EnvironmentObjectSample1
//
//  Created by MsMacM on 2024/05/01.
//

import SwiftUI

class Fruits: ObservableObject {
    @Published var name = "りんご"
    @Published var price = 100
    
}

struct ContentView: View {
    @EnvironmentObject var fruits: Fruits
    @State var isShowBView = false
    
    var body: some View {
        VStack {
            Text("\(fruits.name)-個\(fruits.price)円です")
                .padding()
            Button("１０円値上げする") {
                fruits.price += 10
            }
            .padding()
            Button("BViewへ遷移") {
                isShowBView = true
            }
      }
        .sheet(isPresented: $isShowBView) {
            BView()
        }
    }
}
struct BView: View {
    @EnvironmentObject var fruits: Fruits
    
    var body: some View {
        Button("みかんに変える") {
            fruits.name = "みかん"
        }
    }
}

#Preview {
    ContentView()
        .environmentObject(Fruits())
}
