/*Given unlimited number of $1 note and $2 note. Return how many possible ways to buy an item which has x value.
 Order doesn't matter.
 */

/*
 Solution:
Continously increasing number of $2 note, calculate remaining number of $1 note until reach x
Start with 0 x $2 note, then increase by 1 until it greater than x/2 (maximum number of $2 note can be used)
 */

//Represent one possible combination of $1 note and $2 note that can use to buy an item
struct DollarNoteCombination {
    //number of $1 note required
    var numberOf1DollarNote: Int
    //number of $2 note required
    var numberOf2DollarNote: Int
}

extension DollarNoteCombination: CustomStringConvertible {
    var description: String {
        return "Use \(numberOf1DollarNote)x$1 \(numberOf1DollarNote > 1 ? "notes" : "note") & \(numberOf2DollarNote)x$2 \(numberOf2DollarNote > 1 ? "notes" : "note")"
    }
}

func findPossibleCombinations(_ x: Int) -> [DollarNoteCombination] {
    //if x == 1 there's only 1 possible combination
    if x == 1 {
        return [DollarNoteCombination(numberOf1DollarNote: 1, numberOf2DollarNote: 0)]
    }
    
    var result: [DollarNoteCombination] = []
    findPossibleCombination(0, x, &result)
    return result
}

func findPossibleCombination(_ numberOf2DollarNote: Int, _ x: Int, _ result: inout [DollarNoteCombination]) {
    if numberOf2DollarNote > x/2 {
        return
    }
    result.append(DollarNoteCombination(numberOf1DollarNote: x - 2*numberOf2DollarNote, numberOf2DollarNote: numberOf2DollarNote))
    findPossibleCombination(numberOf2DollarNote+1, x, &result)
}

print("Buy item $1")
findPossibleCombinations(1).forEach { print($0) }
print("Buy item $2")
findPossibleCombinations(2).forEach { print($0) }
print("Buy item $4")
findPossibleCombinations(4).forEach { print($0) }
print("Buy item $5")
findPossibleCombinations(5).forEach { print($0) }
print("Buy item $9")
findPossibleCombinations(9).forEach { print($0) }
print("Buy item $10")
findPossibleCombinations(10).forEach { print($0) }
