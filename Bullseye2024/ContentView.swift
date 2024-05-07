//
//  ContentView.swift
//  Bullseye2024
//
//  Created by Instructor on 4/30/24.
//

import SwiftUI

struct ContentView: View {
    
    // This is our inital state for the alert.
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    
    // Initializes a new instance of the Game struct, represents the current state of the game.
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                // Binds the user interface components necessary for the game.
                InstructionsView(game: $game)
                    .padding(.bottom, alertIsVisible ? 0 : 100)
                if alertIsVisible {
                    PointsView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                      .transition(.scale)
                } else {
                    HitMeButton(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
                      .transition(.scale)
                  }
            }
                if !alertIsVisible {
                  SliderView(sliderValue: $sliderValue)
                    .transition(.scale)
            }
        }
    }
}

// Defines a button triggering an alert when tapped, displays information about the slider value and points scored upon dismissal.
struct HitMeButton: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View {
        Button(action: {
            
            // This is the modified state for the alert.
            self.alertIsVisible = true
        }) {
            Text("HIT ME")
                .bold()
                .font(.title3)
        }
        .padding(20.0)
        .background(
            ZStack {
                Color.blue
                LinearGradient(colors: [Color.white.opacity(0.3), Color.clear], startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21)
        .alert(isPresented: $alertIsVisible, content: {
            let roundedValue = Int(self.sliderValue.rounded())
            let points = self.game.points(sliderValue: roundedValue)
            return Alert(title: Text("Hello, Mason!"), message: Text("The slider's value is \(roundedValue).\n" + "You scored \(points) points."), dismissButton: .default(Text("I did it!")))
        })
    }
}

// Displays instructions for the game, including a message and the target value to aim for.
struct InstructionsView: View {
  @Binding var game: Game

  var body: some View {
    VStack {
      InstructionText(text: "🎯🎯🎯\nPut the Bullseye as close as you can to")
      BigNumberText(text: String(game.target))
    }
  }
}

struct SliderView: View {
  @Binding var sliderValue: Double

  var body: some View {
    HStack {
      SliderLabelText(text: "1")
      Slider(value: $sliderValue, in: 1.0...100.0)
      SliderLabelText(text: "100")
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
