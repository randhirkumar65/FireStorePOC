//
//  VProjectsViewController.swift
//  FireStorePOC
//
//  Created by Randhir Kumar on 10/05/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import UIKit

class VProjectsViewController: UIViewController {
    
    @IBOutlet weak private var aOrderByButton: UIButton!
    @IBOutlet weak private var aEnglishButton: UIButton!
    @IBOutlet weak private var aGermanButton: UIButton!

    @IBOutlet weak private var aTableView: UITableView!
    
    var valtitudeDataSourceArray = [ValtitudeModel]() {
        didSet {
            DispatchQueue.main.async {
                self.aTableView.reloadData()
            }
        }
    }
    var isEnglishSelected = true {
        didSet {
            aTableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        registerCell()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getValtitudeData()
    }
    fileprivate func setupUI() {
        aTableView.estimatedRowHeight = 50
        aTableView.rowHeight = UITableView.automaticDimension
    }
    private func getValtitudeData() {
        VFireStoreServices.shared.getValtitudesData(orderBy: kOrderBy) { (data, error) in
            if error != nil {
                return
            }
            if let data = data {
                self.valtitudeDataSourceArray = data
            }
        }
    }
    
    func registerCell() {
        aTableView.register(UINib(nibName: kProjectListTableViewCellIdentifier, bundle: nil), forCellReuseIdentifier: kProjectListTableViewCellIdentifier)
    }
    
    @IBAction func orderByButtonAction(_ sender: UIButton) {
        
    }
    
    @IBAction func englishButtonAction(_ sender: UIButton) {
        isEnglishSelected = true
    }
    @IBAction func germanButtonAction(_ sender: UIButton) {
        isEnglishSelected = false
    }
}

// MARK: Table View Delegates Method
extension VProjectsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return valtitudeDataSourceArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: kProjectListTableViewCellIdentifier, for: indexPath) as! VProjectListTableViewCell
        let data = valtitudeDataSourceArray[indexPath.row]
        cell.configCell(withModel: data, isEnglishText: isEnglishSelected)
        return cell
    }
}
