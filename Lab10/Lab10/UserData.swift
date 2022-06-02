//
//  UserData.swift
//  Lab10
//
//  Created by Macbook on 2022/6/1.
//

import Foundation
import FirebaseFirestoreSwift
struct UserData: Codable, Identifiable {
    @DocumentID var id: String?
    let account: String
    let name: String
    let password: String
    
}

