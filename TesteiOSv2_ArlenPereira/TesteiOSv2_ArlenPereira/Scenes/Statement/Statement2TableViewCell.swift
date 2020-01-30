//
//  Statament2TableViewCell.swift
//  TesteiOSv2_ArlenPereira
//
//  Created by Arlen Ricardo Pereira on 30/01/20.
//  Copyright © 2020 Arlen Ricardo Pereira. All rights reserved.
//

import UIKit

class Statement2TableViewCell: UITableViewCell {

    @IBOutlet weak var backgroungFrame: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroungFrame.layer.cornerRadius = 5
        backgroungFrame.layer.borderWidth = 1
        backgroungFrame.layer.borderColor = UIColor.clear.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: Variables Cell
    var statementCell: StatementsModel.StatementsRequestModel.ViewModel.DisplayStatements? {
        didSet {
            if let title = statementCell?.title {
                titleLabel.text = title
            }
            
            if let date = statementCell?.date {
                dateLabel.text = date
            }
            
            if let description = statementCell?.desc {
                descriptionLabel.text = description
            }
            
            if let value = statementCell?.value {
                valueLabel.text = "R$ \(String(format:"%.2f", value))"
            }
        }
    }
    
}
