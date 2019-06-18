//
//  ContentView.swift
//  FlagGame
//
//  Created by iosdev on 6/18/19.
//  Copyright © 2019 iosdev. All rights reserved.
//

import SwiftUI

struct ContentView : View {
	
	@State private var countries = ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "spain", "ukraine", "us"].shuffled()
	@State private var correctAnswer = Int.random(in: 0...2)
    @State private var score = 0
    @State private var alertTitle = ""
    @State private var showingAlert = false
    
    var body: some View {
		NavigationView {
            VStack{
                ForEach(0...2) { number in
                    Image(self.countries[number])
                        .border(Color.black, width: 1)
                        .tapAction{
                            self.flagTap(number)
                    }
                }
            }
            .navigationBarTitle(Text(countries[correctAnswer].uppercased()))
                .presentation($showingAlert){
                    Alert(title: Text(alertTitle), message: Text("Your score is \(score)"), dismissButton: .default(Text("Countinue")){
                        self.askQuestion()
                        })
            }
        }
    }
    func flagTap(_ tag: Int){
        if tag == correctAnswer{
            score += 1
            alertTitle = "Correct!"
        }else{
            score -= 1
            alertTitle = "False!"
        }
        showingAlert = true
    }
    
    func askQuestion(){
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
