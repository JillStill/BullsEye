//
//  TextViews.swift
//  BullsEye
//
//  Created by Vodnikova Daria Konstantinovna on 02.05.2023.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text.uppercased())
            .bold()
            .kerning(2)
            .multilineTextAlignment(.center)
            .lineSpacing(4)
            .font(.footnote)
            .foregroundColor(Color("MainTextColor"))
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View{
        
        Text(text)
            .font(.largeTitle)
            .fontWeight(.black)
            .kerning(-1)
            .foregroundColor(Color("MainTextColor"))
    }
}

struct SliderLabelTextView: View{
    
    var text: String
    
    var body: some View{
        Text(text)
            .font(.callout)
            .bold()
            .frame(width: 35.0)
    }
}

struct LabelText: View{
    var text: String
    
    var body: some View{
        Text(text.uppercased())
            .bold()
            .kerning(1.5)
            .font(.caption)
            .foregroundColor(Color("MainTextColor"))
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View{
        Text(text)
            .font(.subheadline)
            .foregroundColor(Color("MainTextColor"))
            .fontWeight(.semibold)
            // .multilineTextAlignment(.center)
            .lineSpacing(12)
         
            
    }
}

struct AlertButtonText: View {
    var text: String
    
    var body: some View{
        Text(text)
            .foregroundColor(.white)
            .font(.headline)
            .fontWeight(.bold)
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.accentColor)
            .cornerRadius(12)

            
            
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "Instructions")
            BigNumberText(text: "999")
            SliderLabelTextView(text: "test")
            LabelText(text: "10")
            BodyText(text: "You scored 200 points!\n            🎉🎉🎉")
            AlertButtonText(text: "Start new round")

        }
        .padding()
    }

}
