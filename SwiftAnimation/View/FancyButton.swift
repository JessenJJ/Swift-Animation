//
//  FancyButton.swift
//  SwiftAnimation
//
//  Created by User50 on 22/04/24.
//

import SwiftUI

struct FancyButton: View {
    @State private var processing = false
    @State private var completed = false
    @State private var loading = false
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: processing ? 240 :300,height: 60)
                .foregroundStyle(completed ? .blue : .green)
                .animation(.spring, value: processing)
            if !processing {
                Text("Submit")
                    .font(.system(.title,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .transition(.move(edge: .top))
            }
            if processing && !completed {
                HStack {
                    Circle()
                        .trim(from: 0,to: 0.5)
                        .stroke(Color.white,lineWidth: 3)
                        .frame(width: 30, height: 30)
                        .rotationEffect(.degrees(loading ? 360 : 0))
                        .animation(.easeIn.repeatForever(autoreverses: false),value: loading)
                    Text("Processing")
                        .font(.system(.title, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                    
                }
                .transition(.opacity)
                .onAppear{
                    startProcessing()
                }
            }
            
            if completed {
                Text("Done")
                    .font(.system(.title,design: .rounded))
                    .fontWeight(.bold)
                    .foregroundStyle(.white)
                    .onAppear{
                        withAnimation (.default){
                            endProcessing()
                        }
                    }
            }
        }
        .onTapGesture {
            if !loading {
                processing.toggle()
            }
        }
    }
}

#Preview {
    FancyButton()
}

// MARK: - EXTENSION
extension FancyButton {
    func startProcessing(){
        loading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 4){
            completed = true
        }
    }
    func endProcessing(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            processing = false
            completed = false
            loading = false
        }
    }
}
