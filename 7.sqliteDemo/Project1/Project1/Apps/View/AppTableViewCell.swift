//
//  AppTableViewCell.swift
//  Project1
//
//  Created by winster jose on 24/08/16.
//  Copyright © 2016 amadeus. All rights reserved.
//

import UIKit

class AppTableViewCell: UITableViewCell {

    var iconImageView : UIImageView?
    var nameLabel : UILabel?
    var publisherNameLabel : UILabel?
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        iconImageView = UIImageView(frame: CGRectMake(10, 10, 60, 60))
        self.addSubview(iconImageView!)
        
        nameLabel = UILabel(frame: CGRectMake(80,10, 210, 25))
        self.addSubview(nameLabel!)
        
        publisherNameLabel = UILabel(frame: CGRectMake(80,45,210,25))
        self.addSubview(publisherNameLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
