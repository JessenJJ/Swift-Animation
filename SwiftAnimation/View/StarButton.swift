//
//  StarButton.swift
//  SwiftAnimation
//
//  Created by User50 on 22/04/24.
//

import SwiftUI

struct StarButton: View {
    @State private var onTapStar = false
    @State private var isLoading = false
    @State private var processing = false
    @State private var completed = false
    
    var body: some View {
        
        VStack {
            Image(systemName: "star.fill")
                .resizable()
            .frame(width: 100, height: 100)
            .onTapGesture {
                withAnimation {
                    onTapStar.toggle()
                    startProcessing()
                }
            }
            
            
            
            if onTapStar {
                if onTapStar{
                    HStack {
                        ForEach(0...4,id: \.self ){item in
                                Circle()
                                    .frame(width: 10, height: 10)
                                    .foregroundStyle(processing ? .green : .gray)
                                    .scaleEffect(processing ? 1.0 : 1.5)
                                    .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(item)), value:processing)
                                    .onAppear{
                                        processing.toggle()
                                        
                                    }
                                        
                            }
                            
                    }

                }else{
                    HStack{
                        Text("5.0")
                        Image(systemName: "star.fill")
                        
                        
                            
                    }
                    .onAppear{
                        withAnimation {
                            endProcessing()
                        }
                        
                    }
                }
                
                
                
            }
            
            
                
            
               
        }
        

        
        
        
    }
}

#Preview {
    StarButton()
}

// MARK: - EXTENSION
extension StarButton {
    func hiding(){
        DispatchQueue.main.asyncAfter(deadline: .now() + 1){
            onTapStar = false
        }
    }
        func startProcessing(){
            onTapStar = true
            isLoading = true
            processing = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 4){
                completed = true
            }
        }
    
        func endProcessing(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 1){
                processing = false
                completed = false
                isLoading = false
            }
        }
    
}
