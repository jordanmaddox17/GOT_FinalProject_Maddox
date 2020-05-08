//
//  Houses.swift
//  GOT_FinalProject_Maddox
//
//  Created by Jordan Maddox on 5/8/20.
//  Copyright © 2020 Jordan Maddox. All rights reserved.
//

import Foundation

class Houses {
    
    var houseArray: [HouseInfo] = []
    var url = "https://www.anapioficeandfire.com/api/houses?page=1&pageSize=50"
    var pageNumber = 1
    var continueLoading = true
    
    func getData(completed: @escaping ()->()) {
        let urlString = "https://www.anapioficeandfire.com/api/houses?page=\(pageNumber)&pageSize=50"
        print("🕸 We are accessing the url \(urlString)")
        
        guard let url = URL(string: urlString) else {
            print("😡 ERROR: Could not create a URL from \(urlString)")
            completed()
            return
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("😡 ERROR: \(error.localizedDescription)")
            }
            do {
                let results = try JSONDecoder().decode([HouseInfo].self, from: data!)
                if results.count > 0 {
                    self.pageNumber = self.pageNumber + 1
                    self.houseArray = self.houseArray + results
                } else {
                    self.continueLoading = false
                }
            } catch {
                print("😡 JSON ERROR: \(error.localizedDescription)")
            }
            completed()
        }
           task.resume()
    }
}
