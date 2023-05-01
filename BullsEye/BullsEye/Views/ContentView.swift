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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text(" 🦎 Put the bullseye as close as you can to")
                .bold()
                .kerning(2)
                .multilineTextAlignment(.center)
                .lineSpacing(4)
                .font(.footnote)
            Text(String(game.target))
                .font(.largeTitle)
                .fontWeight(.black)
                .kerning(-1)
                
            
            HStack{
                Text("1")
                    .font(.callout)
                    .bold()
                Slider(value: $sliderValue, in: 1...100)
                Text("100")
                    .bold()
                    .font(.callout)

            }
            Button(action: {
                alertIsVisible = true
            }) {
              Text("Hit me")
                
            }
            .alert(isPresented: $alertIsVisible) {
                let roundedValue = Int(sliderValue.rounded())
              return Alert(
                title: Text("Hello there!"),
                message: Text("The slider value is \(roundedValue). \nThe total score is \(game.points(sliderValue: roundedValue))"),
                dismissButton: .default(Text("Awesome!")))
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
        ContentView()
            .previewLayout(.fixed(width: 560, height: 320))
    }
}
