import UIKit
import Foundation



protocol Coffee {
    var coast: Swift.Double { get }
}

protocol CoffeeDecorator: Coffee {
    var base: Coffee { get }
    init(_ base: Coffee, options: [Topping] )
}

class SimpleCoffee: Coffee {
    var coast: Swift.Double {
        return 100.0
    }
}

enum Topping {
    case milk
    case syrup
    case sugar
    case doubleCoffee
}

extension Topping: Coffee {
    var coast: Swift.Double {
        switch self {
        case .milk:
            return 20
        case .syrup:
            return 30
        case .sugar:
            return 5
        case .doubleCoffee:
            return 50
        }
    }
}

class OptionCoffee: CoffeeDecorator {
    var base: Coffee
    var options: [Topping]
    
    required init(_ base: Coffee, options: [Topping]) {
        self.base = base
        self.options = options
    }
    
    var coast: Swift.Double {
        return base.coast + options.reduce(0, { partialResult, topping in
            partialResult + topping.coast
        })
    }
}

let coffe = SimpleCoffee()
let doubleCoffeeSyrupSugarMilk = OptionCoffee(coffe, options: [.doubleCoffee, .syrup, .sugar, .milk])


print("coffe: \(coffe.coast)")
print("duoble Coffe + Syrup + Sugar + Milk: \(doubleCoffeeSyrupSugarMilk.coast)")

