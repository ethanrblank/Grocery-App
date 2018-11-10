import Foundation

class Recipe {
    var name: String = ""
    var ingredients: [String : (Double, String)] = [:]
    
    init() {
    }
    
    init(recipeName: String) {
        self.name = recipeName
    }
    
    func editRecipe(ingredientName: String, quantity: Double, unit: String) -> Bool {
        guard self.ingredients[ingredientName] != nil else {
            return false
        }
        self.ingredients[ingredientName] = (quantity, unit)
        return true
    }
    
    func addIngredient(ingredientName: String, quantity: Double, unit: String) -> Bool {
        guard self.ingredients[ingredientName] == nil else {
            return false
        }
        self.ingredients[ingredientName] = (quantity, unit)
        return true
    }
    
    func deleteIngredient(ingredientName: String) -> Bool {
        guard self.ingredients[ingredientName] != nil else {
            return false
        }
        self.ingredients[ingredientName] = nil
        return true
    }
}
