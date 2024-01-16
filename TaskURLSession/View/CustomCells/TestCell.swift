//
//  TestCell.swift
//  TaskURLSession
//
//  Created on 16/01/24.
//

import UIKit

class TestCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.textLabel?.numberOfLines = 0
        self.textLabel?.font = UIFont.boldSystemFont(ofSize: 18.0)
        self.detailTextLabel?.numberOfLines = 0
        self.detailTextLabel?.font = UIFont.systemFont(ofSize: 16)
        self.detailTextLabel?.textColor = .lightGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func configure(model:DataModel){
        self.textLabel?.text = "Title : " + model.title
        self.detailTextLabel?.text =  "Body : " + model.body
    }
}
