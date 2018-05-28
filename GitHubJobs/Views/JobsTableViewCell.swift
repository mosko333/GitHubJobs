//
//  JobsTableViewCell.swift
//  GitHubJobs
//
//  Created by Adam on 28/05/2018.
//  Copyright © 2018 Adam Moskovich. All rights reserved.
//

import UIKit

class JobsTableViewCell: UITableViewCell {

    // MARK: - Properties

    var job: Job? {
        didSet {
            updateViews()
        }
    }
    
    @IBOutlet weak var titleLable: UILabel!
    @IBOutlet weak var companyLable: UILabel!
    @IBOutlet weak var locationLable: UILabel!
    
    // MARK: - Methods
    func updateViews() {
        guard let job = job else { return }
        titleLable.text = job.title
        companyLable.text = job.company
        locationLable.text = job.location
    }
}
