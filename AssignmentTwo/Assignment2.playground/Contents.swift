import UIKit
//1 - Create a linked list protocol----------------------------------------

protocol LinkedList {
    associatedtype Element
    func prepend(element: Element)
    func append(element: Element)
    func removeFirst() -> Node <Element>?
    func removeLast() -> Node <Element>?
    var count: Int { get }
}

//2 - Implement single linked list------------------------------------------

//----------Create Node class which can hold an object of any type----------
public class Node <Element> {
    var value: Element
    
    init(value: Element) {
        self.value = value
    }
    
    var next: Node <Element>?
    weak var previous: Node <Element>?
}

public class SingleLinkedList <Element>: LinkedList{
    var head: Node <Element>?
    weak var tail: Node <Element>?
    var count = 0
//----------prepend: adds the argument to the front of the list----------
    func prepend(element: Element){
        let newNode = Node <Element>(value: element)
        if let headNode = head {
            newNode.next = headNode
            headNode.previous = newNode
            head = newNode
        }
        else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
//----------append: adds the argument to the end of the list----------
    func append(element: Element){
        let newNode = Node <Element>(value: element)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
            tail = newNode
        }
        else {
            head = newNode
            tail = newNode
        }
        count += 1
    }
//----------removeFirst: remove the first item in the linked list and returns it----------
    func removeFirst() -> Node <Element>?{
        let removeNode = head
        if head != nil {
            count -= 1
        }
        if let next = head?.next {
            head = next
        }
        else {
            head = nil
            tail = nil
        }
        return removeNode
    }
//----------removeLast: remove the last item in the linked List and returns it----------
    func removeLast() -> Node <Element>?{
        let removeNode = tail
        if head != nil {
            count -= 1
        }
        if let pre = tail?.previous {
            pre.next = nil
            tail = pre
        }
        else {
            head = nil
            tail = nil
        }
        return removeNode
    }
    
//----------return the object in the list at the given index, throw RangeException Error----------
    enum IndexError: Error {
        case RangeException
    }
    subscript(index: Int) -> Node <Element>? {
        get {
            var p = head
            for _ in 0..<index {
                if let next = p?.next {
                    p = next
                }
                else {
                    assert(false, "RangeException Error")
                }
            }
            return p
        }
    }
//----------elements: interpose a given separator between the elements of the list----------
    private func elements(separatedBy: String) -> NSString {
        var node = head
        var str = ""
        while node != nil {
            str += "\(node!.value)"
            node = node!.next
            if node != nil { str += separatedBy }
        }
        let nsstr = str as NSString
        return nsstr
    }
//----------description: return a String shows the contents of the linked list----------
    func description() -> String {
        var string = "("
        string += self.elements(separatedBy: ", ") as String
        string += ")"
        return string
    }
//3 - add following methods/properties in SingleLinkedList class
    
//----------creates collection containing the specified number of a single, repeated value----------
    init(){}
    init(repeating: Element, count: Int) {
        var c = count
        while(c != 0) {
            self.append(element: repeating)
            c -= 1
        }
    }
//----------a Boolean value indicating whether the collection is empty----------
    var isEmpty: Bool {
        return head == nil
    }
//----------mapping the given closure over the sequence’s elements----------
    func map<T>(mapFunction: (Element) -> T) -> SingleLinkedList <T>{
        let newList = SingleLinkedList <T>()
        var node = head
        while node != nil {
            newList.append(element: mapFunction(node!.value))
            node = node?.next
        }
        return newList
    }
//----------return the result of combining the elements of the linked list using the given closure----------
    func reduce<Result>(result: Result, reduceFunction: (Result, Element) -> Result) -> Result {
        var tempResult = result
        var node = head
        while node != nil {
            tempResult = reduceFunction(tempResult, node!.value)
            node = node?.next
        }
        return tempResult
    }
}


//----------Test Case----------//
let strList = SingleLinkedList<String>()
strList.append(element: "cat")
strList.append(element: "dog")
strList.prepend(element: "pig")
print("===== Test append / prepend / description =====")
print(strList.description())
print("===== Test subscript / throw exception =====")
print(strList[0]?.value)
//print(strList[3]?.value)
print("===== Test removeLast =====")
print(strList.removeLast()?.value)
print("===== Test removeFirst =====")
print(strList.removeFirst()?.value)
print("===== Test init repeating =====")
let list = SingleLinkedList.init(repeating: 5, count: 7)
print(list.description())
print("===== Test map Function: Int -> String =====")
let mapFunc = { (int: Int) -> String in
    return String(int+1)
}
let stringList = list.map(mapFunction: mapFunc)
print(stringList.description())
print("===== Test reduce Function =====")
let reduceFunc = { (result: Int, element: Int) -> Int in
    return result + element
}
let reduceResult = list.reduce(result: 0, reduceFunction: reduceFunc)
print(reduceResult)

//4 - Implement integerValues Method---------------------------------------------------

import Foundation
extension String {
    func integerValues() -> [Int?] {
        let stringArray: [String] = self.components(separatedBy: ",")
        var intArray = [Int?]()
        for item in stringArray {
            intArray.append(Int(item))
        }
        return intArray
    }
}
//----------Test Case----------//
let s1 = "1,2,cat,3,dog,44"
print("===== Test integerValues =====")
print(s1.integerValues())

//5 - Create an enum with associated values for Currency--------------------------------

enum Currency {
    case Euro
    case Dollar
    case Rupee
    case Peso
    
    func getCode() -> String {
        switch self {
        case .Euro: return "EUR"
        case .Dollar: return "USD"
        case .Rupee: return "INR"
        case .Peso: return "MXN"
        }
    }
    func getSymbol() -> UnicodeScalarType {
        switch self {
        case .Euro: return "\u{20AC}"
        case .Dollar: return "\u{24}"
        case .Rupee: return "\u{20B9}"
        case .Peso: return "\u{24}"
        }
    }
    func getRate() -> Float {
        switch self {
        case .Euro: return 0.8904
        case .Dollar: return 1
        case .Rupee: return 66.7
        case .Peso: return 18.88
        }
    }
}

//6 - Create a Money struct.Creating a new money instance requires an amount and a type of currency, which is indicated by using the enum from problem five. Once created a money instance does not change in value. Each instance of Money needs access to the same instance of a Currency enum to access the same conversion rate. The Money struct needs three methods: +, - and description. Both - and + operate on two Money instances. They return a new Money instance. If the two instances are of different currencies the result is in the first (left operand) currency. The method description returns a string representation of the money instance. The string starts with the currency symbol, followed by the amount, followed by a space and ends with the three character symbol for the currency. For example $123.12 USD. Do not worry about formatting the amount.

struct Money {
    var amount: Float
    var currency: Currency
//----------"+" method----------
    static func + (left: Money, right: Money) -> Money {
        if left.currency == right.currency {
            let amount = left.amount + right.amount
            let currency = left.currency
            return Money(amount: amount, currency: currency)
        }
        else {
            let amount = right.amount / right.currency.getRate() * left.currency.getRate() + left.amount
            let currency = left.currency
            return Money(amount: amount, currency: currency)
        }
    }
//----------"-" method----------
    static func - (left: Money, right: Money) -> Money {
        if left.currency == right.currency {
            let amount = left.amount - right.amount
            let currency = left.currency
            return Money(amount: amount, currency: currency)
        }
        else {
            let amount = left.amount - (right.amount / right.currency.getRate() * left.currency.getRate())
            let currency = left.currency
            return Money(amount: amount, currency: currency)
        }
    }
//----------representation of the money instance----------
    func description() -> String {
        let str = self.currency.getSymbol() + String(self.amount) + " " + self.currency.getCode()
        return str
    }
}
//----------Test Case----------//
let eMoney = Money(amount: 50,currency: Currency.Euro)
let eMoney2 = Money(amount: 60, currency: Currency.Euro)
let uMoney = Money(amount: 70, currency: Currency.Dollar)
print("===== Test + method =====")
let adds = uMoney + eMoney
let printStr1 = String(format: "Sum currency amount is %f%@", adds.amount, adds.currency.getSymbol())
print(printStr1)
print("===== Test - method =====")
let minus = eMoney - eMoney2
let printStr2 = String(format: "Minus currency amount is %f%@", minus.amount, minus.currency.getSymbol())
print(printStr2)
print("===== Test description =====")
print(eMoney.description())
