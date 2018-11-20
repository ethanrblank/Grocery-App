import Foundation

class RecipeBook {
    var _book: [String : Recipe]
    
    var book: [String: Recipe] {
        get {
            return self._book
        }
        set {
            self._book = newValue
        }
    }
    
    init() {
        self._book = [:]
    }
    
    func addRecipe(_ recipe: Recipe) -> Bool {
        guard self.book[recipe.name] == nil else {
            return false
        }
        self.book[recipe.name] = recipe
        return true
    }
}
