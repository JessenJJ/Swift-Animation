//
//  MorphingAnimation.swift
//  SwiftAnimation
//
//  Created by User50 on 22/04/24.
//

import SwiftUI

struct MorphingAnimation: View {
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius : recordBegin ? 25.0: 40)
                .frame(width : recordBegin ? 140 : 250,height: recordBegin ? 140 : 250)
                .foregroundStyle(.green)
                .overlay{
                    Image(systemName: "mic.fill")
                        .font(.title)
                        .foregroundStyle(.white)
                        .scaleEffect(recording ? 3 : 5)
                    
                }
            RoundedRectangle(cornerRadius: recordBegin ? 25 : 40)
                .trim(from: 0,to: recordBegin ? 0.02 : 2)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 80 : 265,height: 265)
                .foregroundStyle(.green)
            
                
        }
        .onTapGesture {
            withAnimation(.default){
                recordBegin.toggle()
                recording.toggle()
            }
        }
    }
}

#Preview {
    MorphingAnimation()
}
