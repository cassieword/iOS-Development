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

