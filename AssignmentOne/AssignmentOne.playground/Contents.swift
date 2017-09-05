//: Playground - noun: a place where people can play

import UIKit

//1 -- Write a function that returns the number of palindrome numbers between 0 and n.
func isPalindrome(number: Int) -> Bool {
    var r = 0
    var t = number
    while (t != 0) {
        r = r * 10 + t % 10
        t /= 10
    }
    return r == number
}

func countPalindrome(n: Int) -> Int {
    var x = 0
    var count = 0
    while(x <= n) {
        if(isPalindrome(number: x)){
            print(x)
            count += 1
        }
        x += 1
    }
    return count
}

var p = countPalindrome(n: 191)
print("total palindrome number is \(p)")

//2 -- Returns the sum of the multiples of 3 and 5 less than N
func sumMultiples(number: Int) -> Int {
    var n = 0
    var sum = 0
    while(n < number) {
        if(n != 0 && n%3 == 0 && n%5 != 0) {
            print(n)
            sum += n
            n += 1
        }
        else if(n != 0 && n%3 != 0 && n%5 == 0){
            print(n)
            sum += n
            n += 1
        } else {
            n += 1
        }
    }
    return sum
}

var s = sumMultiples(number: 20)
print("sum of the multiples of 3 and 5 less than N is \(s)")

//3 -- The function patternCount re- turns the number of times the pattern occurs in the text. 
func patternCount(text: String, pattern: String) -> Int{
    let textSize = text.characters.count
    let patternSize = pattern.characters.count
    var point = 0
    var count = 0
    while point <= (textSize - patternSize) {
        let start = text.index(text.startIndex, offsetBy: point)
        let end = text.index(text.startIndex, offsetBy: patternSize + point)
        let substring = text[start..<end]
        if(substring == pattern) {
            count += 1
            point += 1
        } else {
            point += 1
        }
    }
    return count
}

let matchNum = patternCount(text: "abababa", pattern: "ab")
print("The number of times the pattern occurs in the text is \(matchNum)")

//4 --
func popularClasses(studentArray:[Set<String>]) -> Set<String> {
    var intersect = studentArray[0]
    var i = 0
    while i < studentArray.count {
        let courseSet = intersect.intersection(studentArray[i])
        i += 1
        intersect = courseSet
    }
    return intersect
}

let studentA: Set = ["CS101", "CS237", "CS520"]
let studentB: Set = ["CS101", "Math245", "CS237"]
let studentC: Set = ["CS237", "CS560"]

popularClasses(studentArray: [studentA, studentB, studentC])

//5 -- If the input array is empty return the optional average value nil
func average(numberArray: [Int]) -> Double? {
    var average: Double? = 0
    var sum = 0
    var i = 0
    if numberArray.isEmpty {
        average = nil
    } else {
        while i < numberArray.count {
            sum += numberArray[i]
            i += 1
        }
        average = Double(sum) / Double(numberArray.count)
    }
    return average
}
var array1: [Int] = [1,2,3,4]
average(numberArray: array1)

//6 -- If the input is an array of optional ints
func average2(numberArray: [Int?]) -> Double? {
    var average: Double? = 0
    var sum = 0
    var i = 0
    if numberArray.isEmpty {
        average = nil
    } else {
        while i < numberArray.count {
            if numberArray[i] != nil {
                sum += numberArray[i]!
                i += 1
            } else {
                i += 1
            }
        }
        average = Double(sum) / Double(numberArray.count)
    }
    return average
}
var array2: [Int?] = [1,2,3,nil]
average2(numberArray: array2)

//7 --
func cost(product: [String: String]) -> Double {
    var totalCost: Double = 0
    if let quantity = product["quantity"], let price = product["price"]{
        //if value can convert to double or integer
        if let q = Double(quantity), let p = Double(price) {
            totalCost = q * p
        }else {
            print("The value of cannot be converted.")
        }
    } else {
        print("The quantity or price are not exist in the dictionary")
    }
    return totalCost
}
let iceCreamA = ["name":"Mochie Green Tea", "quantity": "2", "price": "2.3"]
let iceCreamB = ["name":"Mochie Green Tea", "price": "2.3"]
print("The total cost of iceCreamA is: \(cost(product: iceCreamA))")
print("The total cost of iceCreamB is: \(cost(product: iceCreamB))")

//8 --
func wordCount(words: String, count: Int) -> [String: Int] {
    var tempSet = Set<String>()
    var dic = [String: Int]()
    let wordsArray = words.components(separatedBy: " ")
    for i in 0..<wordsArray.count {
        if tempSet.contains(wordsArray[i]) {
            if let oldValue = dic[wordsArray[i]] {
                let newValue = oldValue + 1
                dic.updateValue(newValue, forKey: wordsArray[i])
            }
        }else {
            tempSet.insert(wordsArray[i])
            dic[wordsArray[i]] = 1
        }
    }
    for(name, num) in dic {
        if num < count {
            dic.removeValue(forKey: name)
        }
    }
    return dic
}

let w = "cat bat cat rat mouse bat"
let c = 1

wordCount(words: w, count: c)

//9 --
func wordCount2(words: String, count: Int = 2) -> [String: Int] {
    var tempSet = Set<String>()
    var dic = [String: Int]()
    let wordsArray = words.components(separatedBy: " ")
    for i in 0..<wordsArray.count {
        if tempSet.contains(wordsArray[i]) {
            if let oldValue = dic[wordsArray[i]] {
                let newValue = oldValue + 1
                dic.updateValue(newValue, forKey: wordsArray[i])
            }
        }else {
            tempSet.insert(wordsArray[i])
            dic[wordsArray[i]] = 1
        }
    }
    for(name, num) in dic {
        if num < count {
            dic.removeValue(forKey: name)
        }
    }
    return dic
}

wordCount2(words: w)
wordCount2(words: w, count: c)

//10 --
func wordCount3(count: Int) -> (String) -> [String: Int] {
    func wordCount(words: String) -> [String: Int] {
        var tempSet = Set<String>()
        var dic = [String: Int]()
        let wordsArray = words.components(separatedBy: " ")
        for i in 0..<wordsArray.count {
            if tempSet.contains(wordsArray[i]) {
                if let oldValue = dic[wordsArray[i]] {
                    let newValue = oldValue + 1
                    dic.updateValue(newValue, forKey: wordsArray[i])
                }
            }else {
                tempSet.insert(wordsArray[i])
                dic[wordsArray[i]] = 1
            }
        }
        for(name, num) in dic {
            if num < count {
                dic.removeValue(forKey: name)
            }
        }
        return dic
    }
    return wordCount
}

let testA = wordCount3(count: 2)
testA("a a a b c c")
let testB = wordCount3(count: 3)
testB("a a a b c c")
