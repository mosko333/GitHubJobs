//
//  JobListTableViewController.swift
//  GitHubJobs
//
//  Created by Adam on 28/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class JobListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
//    private func refresh() {
//        JobController.fetchJobs(searchTerm: <#T##String#>, completion: <#T##(([Job]?) -> Void)##(([Job]?) -> Void)##([Job]?) -> Void#>)
//    }


    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath)


        return cell
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }

}
