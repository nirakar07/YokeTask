//
//  CardView.swift
//  YokeTask
//
//  Created by Nirakar Sapkota on 8/12/20.
//  Copyright © 2020 Nirakar. All rights reserved.
//

import SwiftUI

struct CardView: View {
    let star: Star
    @State var showingDetail = false
    var body: some View {
//        NavigationLink(destination: DetailView(star: star)){
            ZStack (alignment: .top){
                
                //Image
                Image("player").resizable()  .frame(width: 155, height: 250) // image frame
                    
                    // create outer view with border (color, width)
                    .border(Color.gray.opacity(0.5), width: 0.5)
                    
                    // apply cornerRadius to hide visible cut out after applying border
                    .cornerRadius(8)
                //Title
                VStack{
                    Text(star.name).font(.footnote).bold().lineLimit(1).padding(5).foregroundColor(Color.white)
                    Spacer()
                    //FIFA
                    Text("FIFA 20")
                        .padding(8).foregroundColor(Color.white).background(Color.orange).cornerRadius(10).padding(.bottom, 20)
                }
                
            }.sheet(isPresented: $showingDetail){
                DetailView(star: self.star)
            }.onTapGesture {
                self.showingDetail.toggle()
            }
            
        //}
    }
}


