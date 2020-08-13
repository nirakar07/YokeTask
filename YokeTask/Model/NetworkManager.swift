//
//  NetworkManager.swift
//  Weather
//
//  Created by Nirakar Sapkota on 8/12/20.
//  Copyright © 2020 Nirakar. All rights reserved.
//

import Foundation

class NetworkManager: ObservableObject{
    
    @Published var live = [Star]();
    @Published var featured = [Star]();
    
        // function to fetch data
        func fetchData() {
            // URL Session & Task
            live = [];
            featured = [];
            if let url = URL(string: "https://us-central1-yoke-gaming.cloudfunctions.net/testCall") {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { (data, response, error) in
                    if error == nil {
                        //Decoding JSON
                        let decoder = JSONDecoder()
                        if let safeData = data {
                            do {
                                let results = try decoder.decode(Card.self, from: safeData)
                                DispatchQueue.main.async {
                                    self.liveFeatured(results: results.stars);
                                    print("Loaded Data/Refreshed")
                                }
                            } catch {
                                print(error)
                            }
                        }
                    }
                }
                task.resume()
            }
        }
    
    // classify live players and featured players
    func liveFeatured(results: [Star]) {
        for result in results{
            if (result.isOnline){
                live.append(result);
            }
            else{
                featured.append(result);
            }
        }
    }
}
        

    

