
protocol FoodReadyDelegate: AnyObject {
    func didFinishMakingFood()
    func didFinishMakingFood(restaurantName: String)
}

class Restaurant {
    weak var delegate: FoodReadyDelegate?
    let name: String
    
    init(name: String) {
        self.name = name
    }
    
    func makeFood() {
        print("Making food")
        delegate?.didFinishMakingFood(restaurantName: name)
    }
}


class FoodOrderer: FoodReadyDelegate {
    
    let restaurants: [Restaurant]
    
    init(restaurants: [Restaurant]) {
        self.restaurants = restaurants
    }
    
    func didFinishMakingFood() {
        print("Food is ready")
    }
    
    func didFinishMakingFood(restaurantName: String) {
        print("Food is ready in \(restaurantName)")
    }
    
//    func buyFood() {
//        print("Client order food")
//        let restaurant = Restaurant(name: "Kakes makes blynai")
//        restaurant.delegate = self
//        restaurant.makeFood()
//    }
    
    func orderFood() {
        for restaurant in restaurants {
            restaurant.delegate = self
            restaurant.makeFood()
        }
    }
}

let restaurants = [
    Restaurant(name: "Kakes makes blynai"),
    Restaurant(name: "Gruzinu kacepuriai"),
    Restaurant(name: "Suppa dupa wrape doner kebabai")
]

let foodOrderer = FoodOrderer(restaurants: restaurants)
//foodOrderer.buyFood()
foodOrderer.orderFood()
