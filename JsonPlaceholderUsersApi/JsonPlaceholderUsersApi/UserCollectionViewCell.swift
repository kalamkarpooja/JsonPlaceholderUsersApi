//
//  UserCollectionViewCell.swift
//  JsonPlaceholderUsersApi
//
//  Created by Mac on 03/04/23.
//

import UIKit

class UserCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var websiteLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
