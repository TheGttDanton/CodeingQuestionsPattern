
func maxFruitsBasket(basket: [Character]) -> Int {
    var collecter: [Character: Int] = [:]
    var start = 0
    var maxFruit = 0
    var currentFruit = 0

    for fruit in basket {
        collecter[fruit] = (collecter[fruit] ?? 0) + 1
        currentFruit += 1
        
        while (collecter.count > 2) {
            let startFruit = basket[start]
            let count = collecter[startFruit] ?? 0
            if count <= 1 {
                collecter[startFruit] = nil
            }
            start += 1
            currentFruit -= 1
        }
        
        if currentFruit > maxFruit {
            maxFruit = currentFruit
        }

    }
    
    return maxFruit
}

var basket: [Character] = ["A", "B", "C", "B", "B", "C"]
let maxFruits = maxFruitsBasket(basket: basket)
print(maxFruits)
