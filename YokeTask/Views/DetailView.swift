//
//  DetailView.swift
//  YokeTask
//
//  Created by Nirakar Sapkota on 8/12/20.
//  Copyright © 2020 Nirakar. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    var star: Star
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack{
            ZStack{
                //Image
                Image("player").resizable().aspectRatio(0.60, contentMode: .fit)
                //Title
                VStack{
                    HStack{
                        Button(action: {
                            //Dismiss the sheet when X is pressed
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }) {
                            Text("X").foregroundColor(Color.white)
                        }
                        Spacer()
                        
                        Text(star.name).font(.footnote).bold().lineLimit(1).padding(5).foregroundColor(Color.white)
                        Spacer()
                        
                    }
                    Spacer()
                    Button(action: {
                        print("Join Button tapped!")
                    }) {
                        Text("Join Now")
                    }.padding(8).foregroundColor(Color.white).background(Color.orange).cornerRadius(10).padding(.bottom, 20)
                }
                
            }
        }
        
    }
}

