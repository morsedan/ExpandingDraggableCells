//
//  MainTableViewCell.swift
//  YTExpandingCell
//
//  Created by Morse on 9/24/22.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    static let reuseIdentifier = "cell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: MainTableViewCell.reuseIdentifier)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure() {
        
    }
}
