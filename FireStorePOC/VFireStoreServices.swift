//
//  VFireStoreServices.swift
//  FireStorePOC
//
//  Created by Randhir Kumar on 10/05/19.
//  Copyright © 2019 Randhir Kumar. All rights reserved.
//

import Foundation
import Firebase
import FirebaseFirestore

enum FIRCollectionReferenceType: String {
    case projects = "PROJECT"
    case user = "User"
    case option = "OPTIONS"
    case stages = "STAGES"
    case valtitude = "VALTITUDE"
    
    var description : String {
        get {
            return self.rawValue
        }
    }
}

class VFireStoreServices {
    

    private init() { }
    static let shared = VFireStoreServices()
    
    func configure() {
        FirebaseApp.configure()
    }
    
    func reference(to collectionReference: FIRCollectionReferenceType) -> CollectionReference {
        return Firestore.firestore().collection(collectionReference.rawValue)
    }
    
    func getValtitudesData(orderBy: String, completion: @escaping (_ data: [ValtitudeModel]?,_ err: Error?) -> Void ) {

        let collection = reference(to: .valtitude).order(by: orderBy, descending: false)
        collection.addSnapshotListener { (snapShot, error) in
            var valtitudeModelArray = [ValtitudeModel]()
            guard let snapShot = snapShot else {
                completion(nil,error)
                return
            }
            for document in snapShot.documents {
                valtitudeModelArray.append(ValtitudeModel(data: document.data(), document_Id: document.documentID))
            }
            completion(valtitudeModelArray,nil)
        }
//        reference(to: .valtitude).addSnapshotListener { (snapShot, error) in
//            var valtitudeModelArray = [ValtitudeModel]()
//            guard let snapShot = snapShot else {
//                completion(nil,error)
//                return
//            }
//            for document in snapShot.documents {
//                valtitudeModelArray.append(ValtitudeModel(data: document.data(), document_Id: document.documentID))
//            }
//            completion(valtitudeModelArray,nil)
//        }
//
    }
    
//    func createProjects(param: [String: Any]) {
//        reference(to: .projects).addDocument(data: param)
//    }
    
//    func readProjects() {
//        reference(to: .projects).addSnapshotListener { (snapShot, _) in
//            guard let snapShot = snapShot else { return }
//            for document in snapShot.documents {
//                print(document.data())
//            }
//        }
//    }
//
//    func updateProjects(forDoc documentId: String,params: [String : Any]) {
//        reference(to: .projects).document(documentId).setData(params)
//    }
//
//    func deleteProjects(forDoc documentId: String) {
//        reference(to: .projects).document(documentId).delete { (error) in
//            if error != nil {
//                return
//            }
//        }
//    }
}
