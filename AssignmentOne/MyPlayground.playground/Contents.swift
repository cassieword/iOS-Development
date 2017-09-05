//: Playground - noun: a place where people can play

import UIKit
/*
 let words = "cat bat cat rat mouse bat"
let n = 3
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
for(name, count) in dic {
    if count < n {
        dic.removeValue(forKey: name)
    }
}
 */

/*func wordCount(words: String, count: Int = 2) -> [String: Int] {
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
let c = 3

wordCount(words: w)
wordCount(words: w, count: c)
*/
























