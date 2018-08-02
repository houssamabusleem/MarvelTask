//
//  SearchMainVCProtocol.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

protocol SearchMainVCProtocol {
    func refreshData(total:Int,offset:Int,count:Int)
    func showMessage(title:String,str:String)
    var total:Int?{get set}
    var offset:Int?{get set}
    var count:Int?{get set} //limit
}
