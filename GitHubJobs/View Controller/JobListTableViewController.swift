//
//  JobListTableViewController.swift
//  GitHubJobs
//
//  Created by Adam on 28/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class JobListTableViewController: UIViewController  {
    
    //MARK: - Properties
    var jobs: [Job] = []
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        tableView.delegate = self
        tableView.dataSource = self
    }
    


    
    // MARK: - Navigation

//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destinationViewController.
//        // Pass the selected object to the new view controller.
//    }

}

extension JobListTableViewController: UITableViewDelegate, UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "jobCell", for: indexPath) as! JobsTableViewCell
        let job = jobs[indexPath.row]
        // Cell updates itself when it gets set
        cell.job = job
        return cell
    }
}

extension JobListTableViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        // Little spinny guy on top
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        guard let searchTerm = searchBar.text?.lowercased() else { return }
        
        JobController.fetchJobs(searchTerm: searchTerm) { (jobs) in
            guard let jobs = jobs else { return }
            self.jobs = jobs
            DispatchQueue.main.async {
                UIApplication.shared.isNetworkActivityIndicatorVisible = false
                self.tableView.reloadData()
            }
        }
    }
}



















