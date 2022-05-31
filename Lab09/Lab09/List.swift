//
//  List.swift
//  Lab09
//
//  Created by Macbook on 2022/5/25.
//

import Foundation

class CostList: ObservableObject{
    var cost = 0
    var name = ""
    var comment = ""
    init(name: String, cost: Int,comment: String) {
            self.name = name
            self.cost = cost
            self.comment = comment
        }
        init(){
            name = ""
            cost = 0
            comment = ""
        }
    
}

class Lists: ObservableObject{
    @Published var lists:Array<CostList> = Array()
}
