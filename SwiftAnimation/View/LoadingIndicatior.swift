//
//  LoadingIndicatior.swift
//  SwiftAnimation
//
//  Created by User50 on 22/04/24.
//

import SwiftUI

struct LoadingIndicatior: View {
    @State private var isLoading = false

    
    var body: some View {
        VStack (spacing:30){
            LoadingIndicator()
            
            LoadingPercentage()
        }
    }
}

#Preview {
    LoadingIndicatior()
}

struct LoadingIndicator: View {
    @State private var isLoading = false
    
    var body: some View {
        Circle()
            .trim(from: 0.0, to: 0.7)
            .stroke(Color.green,lineWidth: 5)
            .frame(width: 100,height: 100)
            .rotationEffect(Angle(degrees: isLoading ?  360 : 0))
            .animation(.linear(duration:0.5).repeatForever(autoreverses:false), value: isLoading)
            .onAppear{
                isLoading = true
            }
    }
}

struct LoadingPercentage: View {
    @State private var progress: CGFloat = 0.0
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            Text("\(progress * 100,specifier: "%.f")%")
            
            Circle()
                .stroke(Color(.systemGray5),lineWidth: 12)
            
            
            Circle()
                .trim(from: 0.0, to: 0.7)
                .stroke(Color.green,lineWidth: 12)
                .frame(width: 100,height: 100)
                .rotationEffect(Angle(degrees: isLoading ?  360 : 0))
                .animation(.linear(duration:0.5).repeatForever(autoreverses:false), value: isLoading)
                .onAppear{
                    isLoading = true
                    Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { Timer in
                        // progress = progress + 0.5
                        // progress += 0.05
                        
                        if progress > 1.0 {
                            // Timer.invalidate()
                            progress = 0
                        }else{
                            progress += 0.01
                        }
                        
                        
                        
                        
                    }
                }
            
        }
        .frame(width: 100,height: 100)
    }
}
