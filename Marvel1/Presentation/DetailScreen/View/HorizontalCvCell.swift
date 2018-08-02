//
//  HorizontalCvCell.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import UIKit

class HorizontalCvCell: UICollectionViewCell {
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    func configureCell(url:URL,title:String){
        let placeholderImage = UIImage(named:"icn-nav-close-white")!
        
        self.img.af_setImage(withURL: url, placeholderImage: placeholderImage)
        self.label.text = title
    }
    
}
