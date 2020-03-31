//
//  DrinkDetail.swift
//  Barback
//
//  Created by Harrison Fish on 3/27/20.
//  Copyright © 2020 Harrison Fish. All rights reserved.
//

import Foundation
   
//  7.14 2:30 Arrays in JSON

    func getData(completed: @escaping () -> () ) {
//        let coordinates = "\(latitude),\(longitude)"
        let urlString = "\(APIurls.cocktailDBURL)\(APIKeys.cocktailDBKey)/"
        
        guard let url = URL(string: urlString) else {
            print("Couldn't make a URL from \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error: \(error.localizedDescription)")
            }
            do {
//                let result = try JSONDecoder().decode(Result.self, from: data!)
//                self.timezone = result.timezone
//                self.temperature = result.currently.temperature.rounded()
//                self.summary = result.daily.summary
//                self.dailyIcon = result.daily.icon
            } catch {
                print("Error: \(error.localizedDescription)")
            }
            completed()
        }
        
        task.resume()
    }
