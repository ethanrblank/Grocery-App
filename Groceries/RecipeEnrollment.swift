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
    @IBOutlet weak var ingredientTable: UITableView!
    @IBOutlet weak var addIngredient: UIButton!
    
    
    
    var newRecipe: Recipe = Recipe()
    var ingredientData: [Int] = [0]
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        ingredientTable.dataSource = self
//        ingredientTable.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    
    
    @IBAction func addIngredientTapped(_ sender: Any) {
        let indexPath: IndexPath = IndexPath(row: ingredientData.count - 1, section: 0)
        let cell = ingredientTable.cellForRow(at: indexPath) as? IngredientCell
        print(cell?.ingredientUnit.text)
        
        guard cell!.ingredientName.text != "" || cell!.ingredientQuantity.text != "" || cell!.ingredientUnit.text != "" else {
            print("missing sections")
            return
        }
        ingredientData.append(ingredientData.count)
        //let indexPath: IndexPath = IndexPath(row: ingredientData.count - 1, section: 0)
        ingredientTable.insertRows(at: [indexPath], with: .automatic)
    }
    

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard recipeNameField.text != "" else {
            print("NO NAME")
            return
        }
        newRecipe.name = recipeNameField.text!
        
        var allCells: [IngredientCell] = []
        
        for row in ingredientData {
            let indexPath: IndexPath = IndexPath(row: row, section: 0)
            let cell = ingredientTable.cellForRow(at: indexPath) as? IngredientCell
            allCells.append(cell!)
        }
        print(allCells)
    }
    
}

extension RecipeEnrollment: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ingredientData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = ingredientTable.dequeueReusableCell(withIdentifier: "IngredientCell", for: indexPath) as? IngredientCell
        return cell!
    }
}
