//
//  CustomTableViewCell.swift
//  SpinerViewiOS
//
//  Created by SumitKumar on 01/06/18.
//  Copyright © 2018 SumitKumar. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
    }
    
    open override func awakeFromNib() {
    }
    
}
