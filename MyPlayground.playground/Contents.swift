protocol FoodReadyDelegate: AnyObject {
    func didFinishMakingFood()
}

class Restaurant {
    weak var delegate: FoodReadyDelegate?
    
    func makeFood() {
        print("Making food")
        delegate?.didFinishMakingFood()
    }
}


class FoodOrderer: FoodReadyDelegate {
    
    func didFinishMakingFood() {
        print("Food is ready")
    }
    
    func buyFood() {
        print("Client order food")
        let restaurant = Restaurant()
        restaurant.delegate = self
        restaurant.makeFood()
    }
    
}

let foodOrderer = FoodOrderer()
foodOrderer.buyFood()
