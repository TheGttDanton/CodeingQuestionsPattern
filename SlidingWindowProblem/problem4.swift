//Given an array of characters where each character represents a fruit tree, you are given two baskets, and your goal is to put maximum number of fruits in each basket. The only restriction is that each basket can have only one type of fruit.
//
//You can start with any tree, but you can’t skip a tree once you have started. You will pick one fruit from each tree until you cannot, i.e., you will stop when you have to pick from a third fruit type.
//
//Write a function to return the maximum number of fruits in both baskets.

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
