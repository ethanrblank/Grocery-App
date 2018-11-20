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
    @IBOutlet weak var editIngredientTableButton: UIButton!
    
    var editIngredientButtonSwitch: Bool = false
    
    
    
    var newRecipe: Recipe = Recipe()
    var ingredientData: [Int] = [0]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    
    @IBAction func addIngredientTapped(_ sender: Any) {
        var indexPath: IndexPath = IndexPath(row: ingredientData.count - 1, section: 0)
        let cell = ingredientTable.cellForRow(at: indexPath) as? IngredientCell
        guard cell != nil else {
            ingredientData.append(ingredientData.count)
            indexPath = IndexPath(row: ingredientData.count - 1, section: 0)
            ingredientTable.insertRows(at: [indexPath], with: .automatic)
            return
        }
        
        guard cell!.ingredientName.text != "" || cell!.ingredientQuantity.text != "" || cell!.ingredientUnit.text != "" else {
            print("missing sections")
            return
        }
        ingredientData.append(ingredientData.count)
        indexPath = IndexPath(row: ingredientData.count - 1, section: 0)
        ingredientTable.insertRows(at: [indexPath], with: .automatic)
    }
    
    @IBAction func editIngredientButtonTapped(_ sender: Any) {
        editIngredientButtonSwitch = !editIngredientButtonSwitch
        guard editIngredientButtonSwitch else {
            addIngredient.isEnabled = true
            ingredientTable.setEditing(false, animated: true)
            editIngredientTableButton.setTitle("Edit", for: .normal)
            ingredientTable.setEditing(false, animated: true)
            return
        }
        addIngredient.isEnabled = false
        editIngredientTableButton.setTitle("Done", for: .normal)
        ingredientTable.setEditing(true, animated: true)
    }
    
    

    @IBAction func submitButtonTapped(_ sender: Any) {
        guard recipeNameField.text != "" else {
            print("NO NAME")
            return
        }
        newRecipe.name = recipeNameField.text!
        
        for row in ingredientData {
            let indexPath: IndexPath = IndexPath(row: row, section: 0)
            let cell = ingredientTable.cellForRow(at: indexPath) as? IngredientCell
            let ingredientName = cell?.ingredientName.text
            let ingredientQuantity = cell?.ingredientQuantity.text!.toDouble()
            let ingredientUnit = cell?.ingredientUnit.text
            
            let ingredientAdded: Bool = newRecipe.addIngredient(ingredientName: ingredientName ?? "nil", quantity: ingredientQuantity ?? 0, unit: ingredientUnit ?? "nil")
            print("\(ingredientName ?? "nil") added: \(ingredientAdded)")
        }
        
        
    }
    
}

extension String {
    func toDouble() -> Double? {
        return NumberFormatter().number(from: self)?.doubleValue
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        ingredientData.remove(at: indexPath.row)
        ingredientTable.deleteRows(at: [indexPath], with: .fade)
    }
}
