//
//  ContentView.swift
//  Farm
//
//  Created by Keya Aggarwal on 01/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var happiness = 50
    @State private var duckIsGrowing = false
    var body: some View {
        VStack(spacing: 30) {
            Text("My Little World")
            if happiness < 51 {
                Text("🥺")
            } else if happiness <= 70 {
                Text("🐥")
                    .scaleEffect(duckIsGrowing ? CGFloat(1.3) : CGFloat(1.0))
                    .animation(.spring(), value:duckIsGrowing)
            } else {
                Text("😄")
            }
            Text("Happiness: \(happiness)")
            Button("feed me"){
                duckIsGrowing = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {duckIsGrowing = false}
                happiness = happiness+10
            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
