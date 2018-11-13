//
//  ViewController.swift
//  Groceries
//
//  Created by Ethan Blank on 11/9/18.
//  Copyright © 2018 Ethan Blank. All rights reserved.
//

import UIKit

class RecipeEnrollment: UIViewController {

    @IBOutlet weak var recipeNameField: UITextField!
    
    var newRecipe: Recipe = Recipe()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard recipeNameField.text != "" else {
            print("NO NAME")
            return
        }
        newRecipe.name = recipeNameField.text!
    }
    
}

