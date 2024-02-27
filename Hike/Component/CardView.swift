//
//  CardView.swift
//  Hike
//
//  Created by Fuad Fadlila Surenggana on 12/02/24.
//

import SwiftUI

struct CardView: View {
    // MARK: - PROPERTIES
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: - FUNCTION
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
        
        imageNumber = randomNumber
    }
    
    var body: some View {
        ZStack {
            CustomBackgroundView()
            
            VStack {
                // MARK: - HEADER
                
                VStack(alignment: .leading) {
                    
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                            LinearGradient(colors: [.customGrayLight, .customGrayMedium], startPoint: .top, endPoint: .bottom ))
                        
                        Spacer()
                        
                        Button(action: {
                            print("button pressed")
                            isShowingSheet.toggle()
                        }, label: {
                            CustomButtonView()
                        })
                        .sheet(isPresented: $isShowingSheet, content: {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        })
                        
//                        Button{
//                            //ACTION: Show a sheet
//                            print("button pressed")
//                        } label: {
//                            CustomButtonView()
//                        }
                    }
                    
                    Text("Fun and enjoyable outdoor activity for friends and family.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.customGrayMedium)
                }//: HEADER
                .padding(.horizontal, 30 )
                
                    
                // MARK: - MAIN CONTENT
                
                ZStack {
                    CustomCircleView() 
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.default, value: imageNumber)
                }
                // MARK: - FOOTER
                
                Button(action: {
                    // ACTION: generate random number
                    print("explore more pressed")
                    randomImage()
                }, label: {
                    Text("Explore More")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(colors: [.customGreenLight, .customGreenMedium], startPoint: .top, endPoint: .bottom))
                        .shadow(color: /*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.25), radius: 0.25, x: 1, y: 2) 
                })
                .buttonStyle(GradientButton())
                
            } //: ZSTACK
        } //: CARD
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
