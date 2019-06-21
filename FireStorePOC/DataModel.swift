//
//  DataModel.swift
//  FireStorePOC
//
//  Created by Randhir Kumar on 10/05/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

struct ProjectModel {
    let name: String
    let id: String
    let desc: String
    let timeStamp: Timestamp? = nil
    
    init(name: String,id: String,desc: String) {
        self.name = name
        self.id = id
        self.desc = desc
    }
}

struct UserModel {
    let  timestamp: Timestamp? = nil
    let name: String
    let email: String
    let mobile_number: String
    let id: String?
    
    init(name: String,id: String,email: String,mobileNo: String) {
        self.name = name
        self.id = id
        self.email = email
        self.mobile_number = mobileNo
    }
}

struct StageModel {
    let name: String
    let id: String?
}
struct OptionsModel {
    let stageName: String
    let name: String?
    let isSelected: Bool
    let id: String?
    
}
struct ValtitudeModel {
    var created_time_stamp: Timestamp? = nil
    var english_text: Language?
    var german_text: Language?
    let order: Int?
    let id: String?
    
    init(data: [String: Any], document_Id: String) {
        self.created_time_stamp = data[kCreatedTimeStamp] as? Timestamp
        self.order = data[kOrderBy] as? Int
        self.id = data[kId] as? String
        self.english_text = Language(dict: data[kEnglishText] as? Dictionary<String, String> ?? [:])
        self.german_text = Language(dict: data[kGermanText] as? Dictionary<String, String> ?? [:])
    }
}

struct Language {
    let header: String?
    let description: String?
    
    init(dict: Dictionary<String, String>) {
        self.header = dict["header"]
        self.description = dict["description"]
    }
}

