//
//  RoundedViews.swift
//  BullsEye
//
//  Created by Vodnikova Daria Konstantinovna on 06.05.2023.
//

import SwiftUI

struct RoundedImageViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("MainTextColor"))
            .frame(width: 56, height: 56)
            .overlay(Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0))
    }
}

struct RoundedImageViewFilled: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("ButtonFilledTextColor"))
            .frame(width: 56, height: 56)
            .background(Circle()
                .fill(Color("ButtonFilledBackgroundColor")))
            .background((Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0)))
    }
}

struct RoundedRectViewStroked: View {
    var systemName: String
    var body: some View {
        Image(systemName: systemName)
            .font(.title)
            .foregroundColor(Color("MainTextColor"))
            .frame(width: 56, height: 56)
            .overlay(Circle().strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0))
    }
}

struct RoundedRectTextView: View{
    var text: String
    
    var body: some View{
        Text(text)
            .font(.title2)
            .fontWeight(.bold)
            .kerning(-0.2)
            .foregroundColor(Color("MainTextColor"))
            .frame(width: 68, height: 56)
            .overlay(RoundedRectangle(cornerRadius: 21).strokeBorder(Color("ButtonStrokeColor"), lineWidth: 2.0))
    }
}

struct PreviewView: View {
    var body: some View {
        VStack(spacing: 10) {
            RoundedImageViewStroked(systemName: "arrow.counterclockwise")
            RoundedImageViewFilled(systemName: "list.dash")
            RoundedRectTextView(text: "ee")
        }
    }
}


struct RoundedViews_Previews: PreviewProvider {
    static var previews: some View {
        PreviewView()
        PreviewView()
            .preferredColorScheme(.dark)
    }
}
