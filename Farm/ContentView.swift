//
//  ContentView.swift
//  Farm
//
//  Created by Keya Aggarwal on 01/09/26.
//

import SwiftUI

struct Goal {
    var name: String
    var completed: Bool
    var message: String
    var reward: Int
}

struct ContentView: View {
    @State private var happiness = 30
    @State private var duckIsGrowing = false
    @State private var duckMessage = ""
    @State private var goals = [
        Goal(name: "Read 20 pages", completed: false, message: "Growing genuis", reward: 10),
        Goal(name: "Go to the gym", completed: false, message: "holy buff", reward: 15)
    ]
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
            Text(duckMessage)
            Text("Happiness: \(happiness)")
            
            Text("TODAY")
            ForEach(goals.indices, id: \.self) { index in

                Text(goals[index].completed ? "✓ \(goals[index].name)" : "□ \(goals[index].name)")

                if !goals[index].completed {
                    Button("Complete") {
                        goals[index].completed = true
                        happiness += goals[index].reward
                        duckIsGrowing = true
                        duckMessage = goals[index].message
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {duckIsGrowing = false
                            duckMessage = ""}
                        
                        
                    }
                }
            }
//
//            Button("feed me"){
//                duckIsGrowing = true
//                
//                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {duckIsGrowing = false}
//                happiness = happiness+10
//            }
            
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
