//
//  ContentView.swift
//  Farm
//
//  Created by Keya Aggarwal on 01/09/26.
//

import SwiftUI

struct ContentView: View {
    @State private var happiness = 30
    @State private var duckIsGrowing = false
    @State private var taskCompleted = false
    var body: some View {
        VStack(spacing: 30) {
            Text("My Little World")
            if happiness < 40 {
                Text("🥺")
            } else if happiness <= 70 {
                Text("🐥")
                    .scaleEffect(duckIsGrowing ? CGFloat(1.3) : CGFloat(1.0))
                    .animation(.spring(), value:duckIsGrowing)
            } else {
                Text("😄")
            }
            Text("Happiness: \(happiness)")
            Text(taskCompleted ? "✓ Read 20 pages" : "□ Read 20 pages")
            if (!taskCompleted){
                Button("Complete") {
                taskCompleted = true
                happiness += 10
            }
            }
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
