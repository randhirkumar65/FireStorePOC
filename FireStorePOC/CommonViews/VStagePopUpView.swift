//
//  VStagePopUpView.swift
//  FireStorePOC
//
//  Created by Randhir Kumar on 10/05/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import UIKit

class VStagePopUpView: UIView {

    @IBOutlet weak private var aTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}

// MARK: Table View Delegate Method
extension VStagePopUpView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "VStagePopUpViewCell")
        cell.backgroundColor = .red
        cell.textLabel?.text = "Stage\(indexPath.row)"
        return cell
    }
}
