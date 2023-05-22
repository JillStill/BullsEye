//
//  ContentView.swift
//  BullsEye
//
//  Created by Vodnikova Daria Konstantinovna on 29.04.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var alertIsVisible = false
    @State private var sliderValue = 50.0
    @State private var game = Game()
    
    var body: some View {
        ZStack {
            BackgroundView(game: $game)
            VStack {
                Image(systemName: "minus.forwardslash.plus")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                    .padding(.all, 3)
                InstructionsView(game: $game)
                    .padding(.bottom, 100)
                HitMeButtonView(alertIsVisible: $alertIsVisible, sliderValue: $sliderValue, game: $game)
            }
            SliderView(sliderValue: $sliderValue)
        }
    }
}

struct InstructionsView: View{
    @Binding var game: Game
    
    var body: some View {
        VStack {
            InstructionText(text: "Put the bullseye as close as you can to")
                .padding(.horizontal, 30)
            BigNumberText(text: String(game.target))
        }
    }
}

struct SliderView: View{
    @Binding var sliderValue: Double
    
    var body: some View{
        HStack{
            SliderLabelTextView(text: "1")
            Slider(value: $sliderValue, in: 1...100)
            SliderLabelTextView(text: "100")
        }
        .foregroundColor(Color("MainTextColor"))
        .padding()
    }
}

struct HitMeButtonView: View {
    @Binding var alertIsVisible: Bool
    @Binding var sliderValue: Double
    @Binding var game: Game
    
    var body: some View{
        Button(
            action: {
                alertIsVisible = true
            }
        ) {
            Text("Hit me".uppercased())
                .bold()
                .font(.title3)
        }
        .padding(20)
        .background(
            ZStack {
                Color("HitmeColor")
                LinearGradient(gradient: Gradient(colors: [Color.white.opacity(0.3), Color.clear]), startPoint: .top, endPoint: .bottom)
            }
        )
        .foregroundColor(Color.white)
        .cornerRadius(21)
        .overlay(RoundedRectangle(cornerRadius: 21).strokeBorder(Color.white, lineWidth: 2.0))
        .alert(isPresented: $alertIsVisible) {
            let roundedValue = Int(sliderValue.rounded())
            let points = game.points(sliderValue: roundedValue)
            return Alert(
                title: Text("Hello there!"),
                message: Text("The slider value is \(roundedValue). \nYou scored \(points) points this round"),
                dismissButton: .default(Text("Awesome!")){
                    game.startNewRound(points: points)
                }
            )
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
            ContentView()
                .previewLayout(.fixed(width: 560, height: 320))
            ContentView()
                .preferredColorScheme(.dark)
            ContentView()
                .previewLayout(.fixed(width: 568, height: 320))
                .preferredColorScheme(.dark)
        }
    }
}
