//
//  TableViewCell.swift
//  manithaTest
//
//  Created by Arvind Kant on 15/07/21.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var lblname: UILabel!
    
    @IBOutlet var lblAuthor: UILabel!
    @IBOutlet var lbldescription: UILabel!
    @IBOutlet var avatarImg : UIImageView!
    @IBOutlet var lbllang: UILabel!
    @IBOutlet var lblstars: UILabel!
    @IBOutlet var lblfork: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatarImg.layer.masksToBounds = false
        avatarImg.layer.cornerRadius = avatarImg.frame.height / 2
        avatarImg.clipsToBounds = true

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
