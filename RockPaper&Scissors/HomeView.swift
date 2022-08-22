//
//  HomeView.swift
//  RockPaper&Scissors
//
//  Created by Caio Castro on 16/08/2022.
//

import SwiftUI

struct HomeView: View {
    @State private var showingScore = false
    @State private var winOrLose = "Let's start"
    @State private var machineSorted = "Rock"
    @State private var playerSorted = "Rock"
    @State private var currentScore = 0
    @State private var numberOfRouds = 10
    @State private var endOfGame = false
    @State private var endMessage = ""
    @State private var machineChoice = Int.random(in: 0...3)
    @State private var machineScore = 0
    @State private var playerScore = 0
    
    
    
    var body: some View {
        ZStack {
            LinearGradient(stops: [.init(color: Color(red: 0.10, green: 0.25, blue: 0.50), location: 0.50),
                                   .init(color: Color(red: 0.76, green: 0.10, blue: 0.20), location: 0.50)],
                           startPoint: .top, endPoint: .bottom)
            .ignoresSafeArea(.all)
            
            VStack {
                VStack(spacing: 56) {
                        HStack(spacing: 45) {
                            Text("\(machineScore)")
                                .padding()
                                .background(Color.gray)
                                .clipShape(Circle())
                            Image(machineSorted)
//                            Spacer()
                        }
    //                    .padding(.vertical,20)
                        HStack(spacing: 45) {
                            Text("\(playerScore)")
                                .padding()
                                .background(Color.gray)
                                .clipShape(Circle())
                            Image(playerSorted)
                                .onTapGesture {
                                    let tapMachine = Int.random(in: 0...2)
                                    machineSorted = sortedImage(tapMachine)
                                    
                                    
                                    let tapPlayer = Int.random(in: 0...2)
                                    playerSorted = sortedImage(tapPlayer)
                                    
                                    calculateScore(player: tapPlayer, machine: tapMachine)
                                    endOfGameII()
                                    endMessageII()
                                }
                        }
                        }
                                .frame(maxWidth: .infinity)
                                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .opacity(0.7)
                .cornerRadius(20)
                .padding()
                Text(winOrLose)
                    .font(.subheadline.bold())
                    .padding()
                    .background(.gray)
                    .clipShape(Capsule())
                
            }
            .padding()
            Spacer()
            }
        .alert(endMessage, isPresented: $endOfGame){
            Button("Restart") {}
            
        }
        }
    func sortedImage(_ num: Int) -> String {
        if num == 0 {
            return "Rock"
        } else if num == 1 {
                return "Paper"
        } else if num == 2 {
            return "Scissors"
        }
        return ""
    }
    func calculateScore(player: Int, machine: Int) {
        if machine == 0 && player == 1 {
            playerScore += 1; winOrLose = "You won!"
        } else if machine == 1 && player == 0  {
            machineScore += 1;  winOrLose = "You lost!"
        } else if machine == 1 && player == 2 {
            playerScore += 1; winOrLose = "You won!"
        } else if machine == 2 && player == 1 {
            machineScore += 1; winOrLose = "You lost!"
        } else if machine == 2 && player == 0 {
            playerScore += 1; winOrLose = "You won!"
        } else if machine == 0 && player == 2 {
            machineScore += 1; winOrLose = "You lost!"
        }
        return
    }
    func endOfGameII() {
        if  machineScore == 10 || playerScore == 10 {
            endOfGame = true; machineScore = 0; playerScore = 0
        }
        endOfGame = false
    }
    func endMessageII() {
        if playerScore == 10 {
            endMessage = "Congrats, you won!"
        } else if machineScore == 10 {
            endMessage = "Oh no, you lost!"
        }
    }
    }
    

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
