//
//  TextViews.swift
//  Bullseye2024
//
//  Created by Instructor on 5/6/24.
//

import SwiftUI

struct InstructionText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .kerning(2.0)
            .multilineTextAlignment(.center)
            .lineSpacing(4.0)
            .font(.footnote)
    }
}

struct BigNumberText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .kerning(-0.1)
            .font(.largeTitle)
            .fontWeight(.bold)
    }
}

struct SliderLabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .frame(width: 35)
    }
}

struct LabelText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .kerning(1.5)
            .font(.caption)
    }
}

struct BodyText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.subheadline)
            .fontWeight(.semibold)
            .multilineTextAlignment(.center)
            .lineSpacing(12.0)
    }
}

struct ButtonText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .bold()
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.green)
            .foregroundColor(.white)
            .cornerRadius(12.0)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            InstructionText(text: "INSTRUCTIONS")
            BigNumberText(text: "999")
            SliderLabelText(text: "99")
            LabelText(text: "SCORE")
            BodyText(text: "You score 200 points\n🎉🎉🎉")
            ButtonText(text: "Start New Round")
        }
        .padding()
    }
}
