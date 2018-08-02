//
//  CharacterCell.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import UIKit
import AlamofireImage

class CharacterCell: UITableViewCell {

    @IBOutlet weak var characterImg: UIImageView!
    //    @IBOutlet weak var characterImg: UIImageView!
    @IBOutlet weak var characterNameLbl: UILabel!
    //
//    @IBOutlet weak var characterNameLbl: UILabel!
//
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    func configureCell(img:URL, name: String){
        //self.characterImg.image = img
        let placeholderImage = UIImage(named:"icn-nav-close-white")!
        
        self.characterImg.af_setImage(withURL: img, placeholderImage: placeholderImage)
        self.characterNameLbl.text = name
    }

}
