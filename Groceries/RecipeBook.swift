import Foundation

class RecipeBook {
    var book: [String : Recipe] = [:]
    
    init() {
    }
    
    func addRecipe(_ recipe: Recipe) -> Bool {
        guard self.book[recipe.name] != nil else {
            return false
        }
        self.book[recipe.name] = recipe
        return true
    }
}
