//
//  ContentView.swift
//  MileStoneProject 1-3
//
//  Created by Anisha Lamichhane on 4/6/21.
//

import SwiftUI


struct symbol: View {
    var name: String
    
    var body: some View {
        Text(name)
            .font(Font.system(size: 50))
            .clipShape(Capsule())
            .overlay(Capsule().stroke(Color .black, lineWidth: 1))
            .shadow(color: .black, radius: 2)
    }
}


struct ContentView: View {
    @State private var moves = ["✊", "✌️", "✋"].shuffled()
    @State private var game = ["WIN", "LOSE"].shuffled()
    @State private var gameState = Int.random(in: 0 ... 1)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    @State private var score = 0
   
    
    @State private var correctAnswer = Int.random(in: 0 ... 2)
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors:[.blue, .black]), startPoint: .top, endPoint: .bottom)
                       .edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 50) {
                
                VStack {
                    Text("Rock Scissor Paper")
                        .foregroundColor(.white)
                        .font(.title)
                        .fontWeight(.black)
                }
                VStack(spacing: 20) {
                    Text(moves[correctAnswer])
                        .font(Font.system(size: 110))
                        
                    Text("How to \(game[gameState]) this game")
                        .foregroundColor(.green)
                        .font(.body)
                        .fontWeight(.black)
                    
                
                }
                
                HStack(spacing: 40) {
                    ForEach(0 ..< 3){
                        number in
                        Button(action: {
                            //flag was tapped
                           
                        self.buttonTapped(number)
                            
                            
                        }) {
                            symbol(name: self.moves[number])
                        }
                    }
                    
                }
                
                VStack (spacing: 150){
                    Text(" Score: \(score)")
                        .foregroundColor(.green)
                        .fontWeight(.black)
                   
                }
                
            }
        
        }
        
        .alert(isPresented: $showingScore) {
            Alert(title: Text(scoreTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Continue")) {
                self.askQuestion()
            })
        }
    }
    
    func buttonTapped(_ number: Int) {
        if game[gameState] == "win" {
            if ( moves[correctAnswer] == "✊") {
                if moves[number] == "✋" {
                    scoreTitle = "Awesome you are doing great!!"
                    score += 5
                }else {
                    scoreTitle = "OOps you did wrong"
                    score -= 3
                }
            } else if(moves[correctAnswer] == "✌️"){
                if moves[number] == "✊" {
                    scoreTitle = "Awesome you are doing great!!"
                    score += 5
                }else {
                    scoreTitle = "OOps you did wrong"
                    score -= 3
                }
            }else {
                if moves[number] == "✌️" {
                    scoreTitle = "Awesome you are doing great!!"
                    score += 5
                }else {
                    scoreTitle = "OOps you did wrong"
                    score -= 3
                }
            }
            showingScore = true
        } else {
            if ( moves[correctAnswer] == "✊") {
                if moves[number] == "✌️" {
                    scoreTitle = "Awesome you are doing great!!"
                    score += 5
                }else {
                    scoreTitle = "OOps you did wrong"
                    score -= 3
                }
            } else if(moves[correctAnswer] == "✌️"){
                if moves[number] == "✋" {
                    scoreTitle = "Awesome you are doing great!!"
                    score += 5
                }else {
                    scoreTitle = "OOps you did wrong"
                    score -= 3
                }
            }else {
                if moves[number] == "✊" {
                    scoreTitle = "Awesome you are doing great!!"
                    score += 5
                }else {
                    scoreTitle = "OOps you did wrong"
                    score -= 3
                }
            }
        }
        showingScore = true
        
        
       
    }
    
    func buttonTapped1(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Awesome you are doing great!!"
            score += 5
        } else {
            scoreTitle = "OOps you did wrong"
            score -= 3
        }
        showingScore = true
    }
    
    
    func askQuestion() {
     moves.shuffle()
     correctAnswer = Int.random(in: 0 ... 2)
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
