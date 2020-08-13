//
//  ContentView.swift
//  YokeTask
//
//  Created by Nirakar Sapkota on 8/12/20.
//  Copyright © 2020 Nirakar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var network = NetworkManager();
    @State var oneOnline: Bool = false;
    
    //Navbar and Tab bar settings
    init() {
        UINavigationBar.appearance().barTintColor = UIColor(red: 19.0/255.0, green: 20.0/255.0, blue: 71.0/255.0, alpha: 1)
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
        UITabBar.appearance().barTintColor =  UIColor(red: 19.0/255.0, green: 20.0/255.0, blue: 71.0/255.0, alpha: 1)
    }
    
    // private method to handle scrollview (horizontal for both live and featured)
    fileprivate func privateScrollMethod(live: Bool) -> ScrollView<HStack<ForEach<[Star], String, CardView>>> {
        // for live players
        if (live){
            return ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(network.live) {star in
                        CardView(star: star)
                    }
                }
            }
        }
            
        // for featured players
        else{
            return ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                    ForEach(network.featured) {star in
                        CardView(star: star)
                    }
                }
                
            }
            
        }
    }
    
    //Body
    var body: some View {
        TabView{
               NavigationView {
                    List{
                        if (network.live.count > 0){
                            Text("LIVE NOW").fontWeight(.heavy)
                            privateScrollMethod(live: true)
                        }
                        if (network.featured.count > 0){
                            Text("FEATURED").fontWeight(.heavy)
                            privateScrollMethod(live: false)
                        }
                        
                    }.navigationBarTitle("YOKE", displayMode: .inline)
                    
                }.onAppear(){
                    self.network.fetchData();
                    UITableView.appearance().separatorStyle = .none;
                }
                .tabItem{
                    Image(systemName: "star")
                    Text("Home")
            }.tag(0)
            DiscoverView().tabItem{
                Image(systemName: "magnifyingglass")
                Text("Discover")
            }.tag(1)
            
            DiscoverView().tabItem{
                Image(systemName: "bolt")
                Text("Challenges")
            }.tag(2)
            DiscoverView().tabItem{
                Image(systemName: "person.circle")
                Text("Profile")
            }.tag(3)
                
        }.foregroundColor(Color(red: 19.0/255.0, green: 20.0/255.0, blue: 71.0/255.0, opacity: 1))
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
