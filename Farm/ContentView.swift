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
    
    @State private var newGoalName = ""
    @State private var newGoalReward = 10
    @State private var messageType = "Random"
    @State private var newGoalMessage = ""
    
    @State private var goals: [Goal] = []
    
    let randomMessages = [
        "You did amazing!",
        "Look at you go!",
        "The duck is proud!",
        "Keep it up!",
        "Another one done!",
        "You're crushing it!",
        "Great job!",
        "Your little world is growing!"
    ]
    
    var body: some View {
        
        VStack(spacing: 30) {
            
            Text("My Little World")
            
            if happiness < 40 {
                Text("🥺")
            } else if happiness <= 70 {
                Text("🐥")
                    .scaleEffect(
                        duckIsGrowing ? CGFloat(1.3) : CGFloat(1.0)
                    )
                    .animation(.spring(), value: duckIsGrowing)
            } else {
                Text("😄")
            }
            
            Text(duckMessage)
            
            Text("Happiness: \(happiness)")
            
            Text("TODAY")
            
            ForEach(goals.indices, id: \.self) { index in
                
                if !goals[index].completed {
                    
                    HStack {
                        Text("□ \(goals[index].name)")
                        
                        Spacer()
                        
                        Button("Complete") {
                            goals[index].completed = true
                            happiness += goals[index].reward
                            duckIsGrowing = true
                            duckMessage = goals[index].message
                            
                            DispatchQueue.main.asyncAfter(
                                deadline: .now() + 1.5
                            ) {
                                duckIsGrowing = false
                                duckMessage = ""
                            }
                        }
                    }
                }
            }
            
            // Completed goals
            ForEach(goals.indices, id: \.self) { index in
                
                if goals[index].completed {
                    
                    Text("✓ \(goals[index].name)")
                        .strikethrough()
                }
            }
            
            Divider()
            
            Text("ADD GOAL")
                .font(.headline)
            
            TextField("New goal", text: $newGoalName)
            
            Picker("Reward", selection: $newGoalReward) {
                Text("5").tag(5)
                Text("10").tag(10)
                Text("15").tag(15)
                Text("20").tag(20)
            }
            .pickerStyle(.segmented)
            
            Picker("Message", selection: $messageType) {
                Text("Random").tag("Random")
                Text("Custom").tag("Custom")
            }
            .pickerStyle(.segmented)
            
            if messageType == "Custom" {
                TextField("Enter your message", text: $newGoalMessage)
            }
            
            Button("Add Goal") {
                
                var message = ""
                
                if messageType == "Random" {
                    message = randomMessages.randomElement()!
                } else {
                    message = newGoalMessage
                }
                
                let newGoal = Goal(
                    name: newGoalName,
                    completed: false,
                    message: message,
                    reward: newGoalReward
                )
                
                goals.append(newGoal)
                
                newGoalName = ""
                newGoalReward = 10
                messageType = "Random"
                newGoalMessage = ""
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
