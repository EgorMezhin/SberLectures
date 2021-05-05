// ДЗ: Реализовать функцию sumTwoValues
//
import Foundation

// Создаем протокол Addable. На него будем подписывать разные типы для реализации сложения.
//
protocol Addable {
    static func + (firstValue: Self, secondValue: Self) -> Self
}

//  Функция sumTwoValues для сложения значений типов, подписанных под Addable.
//
func sumTwoValues<T: Addable>(_ fisrtValue: T, _ secondValue: T) -> T {
    return fisrtValue + secondValue
}

// Тест для Int
//
extension Int: Addable { }
let firstInt = 10
let secondInt = 5
let resultInt = sumTwoValues(firstInt, secondInt)
print(resultInt)

// Тест для Double
//
extension Double: Addable { }
let firstDouble = 20.5
let secondDouble = 14.5
let resultDouble = sumTwoValues(firstDouble, secondDouble)
print(resultDouble)

// Тест для String
//
extension String: Addable { }

let firstString = "ABC"
let secondString = "DEF"
let resultString = sumTwoValues(firstString, secondString)
print(resultString)
