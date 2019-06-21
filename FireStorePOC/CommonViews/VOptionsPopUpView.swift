//
//  VOptionsPopUpView.swift
//  FireStorePOC
//
//  Created by Randhir Kumar on 10/05/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import UIKit

class VOptionsPopUpView: UIView {

    @IBOutlet weak private var aTableView: UITableView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}

// MARK: Table View Delegate Method
extension VOptionsPopUpView: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "VOptionsPopUpViewCell")
        cell.backgroundColor = .red
        cell.textLabel?.text = "Options\(indexPath.row)"
        return cell
    }
}
