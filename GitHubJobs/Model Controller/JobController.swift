//
//  JobController.swift
//  GitHubJobs
//
//  Created by Adam on 28/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import Foundation

class JobController {
    
    //https://jobs.github.com/positions.json?description=swift
    let shared = JobController()
    static let baseURL = URL(string: "https://jobs.github.com/")
    
    static func fetchJobs(searchTerm: String, completion: @escaping (([Job]?) -> Void)) {
        // URL
        guard var url = baseURL else { completion(nil) ; return}
        url.appendPathComponent("positions")
        url.appendPathExtension("json")
        
        //QUERIES
        //Step 1: Get URL components
        var componets = URLComponents(url: url, resolvingAgainstBaseURL: true)
        //Step 2: get array of queries
        let jobSearchQuery = URLQueryItem(name: "description", value: searchTerm)
        //Step 3: Combine step 1 and 2 into array aka set component query items
        let queryArray = [jobSearchQuery]
        componets?.queryItems = queryArray
        //Step 4: Create fully contructed URL
        guard let finalUrl = componets?.url else { completion(nil) ; return }
        print("📡📡📡\(finalUrl.absoluteString)📡📡📡")
        
        // request - not needed because we are using defualt settings
        
        //URLSession, dataTask - resume - decode
        URLSession.shared.dataTask(with: finalUrl) { (data, _, error) in
            if let error = error {
                print("❌ Error fetching data \(error.localizedDescription)")
                completion(nil) ; return
            }
            
            guard let data = data else { completion(nil) ; return }
            let jsonDecoder = JSONDecoder()
            do {
                let jobs = try jsonDecoder.decode([Job].self, from: data)
                completion(jobs) ; return
            }catch {
                print("❌ Error decoding data \(error.localizedDescription)")
                completion(nil) ; return
            }
            
            }.resume()
    }
}
