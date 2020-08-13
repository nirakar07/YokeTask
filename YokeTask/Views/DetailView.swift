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
                Image("player").resizable().aspectRatio(contentMode: .fit)
                //Title
                VStack{
                    HStack{
                        // X Button
                        Button(action: {
                            //Dismiss the sheet when X is pressed
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }) {
                            Text("X").foregroundColor(Color.white).background(Color.orange)
                        }
                        Spacer()
                        // Star's name at the top
                        Text(star.name).font(.footnote).bold().lineLimit(1).padding(5).foregroundColor(Color.white)
                        Spacer()
                        
                    }
                    Spacer()
                    
                    // Join Button
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

