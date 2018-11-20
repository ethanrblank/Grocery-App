import Foundation

class Recipe {
    private var _name: String
    private var _ingredients: [String : (Double, String)]
    
    var name: String {
        get {
            return self._name
        }
        set {
            self._name = newValue.lowercased()
        }
    }
    var ingredients: [String : (Double, String)] {
        get {
            return self._ingredients
        }
        set {
            var lowercasedIngredients: [String : (Double, String)] = [:]
            for ingredient in newValue {
                let ingredientName = ingredient.key.lowercased()
                let ingredientQuantity = ingredient.value.0
                let ingredientUnit = ingredient.value.1.lowercased()
                lowercasedIngredients[ingredientName] = (ingredientQuantity, ingredientUnit)
            }
            self._ingredients = lowercasedIngredients
        }
    }
    
    init() {
        self._name = ""
        self._ingredients = [:]
    }
    
    convenience init(recipeName: String) {
        self.init()
        self.name = recipeName.lowercased()
    }
    
    func editRecipe(ingredientName: String, quantity: Double, unit: String) -> Bool {
        guard self.ingredients[ingredientName.lowercased()] != nil else {
            return false
        }
        self.ingredients[ingredientName.lowercased()] = (quantity, unit.lowercased())
        return true
    }
    
    func addIngredient(ingredientName: String, quantity: Double, unit: String) -> Bool {
        guard self.ingredients[ingredientName.lowercased()] != nil else {
            return false
        }
        self.ingredients[ingredientName.lowercased()] = (quantity, unit.lowercased())
        return true
    }
    
    func deleteIngredient(ingredientName: String) -> Bool {
        guard self.ingredients[ingredientName.lowercased()] != nil else {
            return false
        }
        self.ingredients[ingredientName.lowercased()] = nil
        return true
    }
}
