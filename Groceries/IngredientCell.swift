//
//  IngredientCell.swift
//  Groceries
//
//  Created by Ethan Blank on 11/13/18.
//  Copyright © 2018 Ethan Blank. All rights reserved.
//

import UIKit

class IngredientCell: UITableViewCell {
    @IBOutlet weak var ingredientName: UITextField!
    @IBOutlet weak var ingredientQuantity: UITextField!
    @IBOutlet weak var ingredientUnit: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
