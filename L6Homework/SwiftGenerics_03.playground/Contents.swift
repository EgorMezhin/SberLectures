// ДЗ: реализовать универсальный связанный список на основе перечисления
//
import Foundation

enum LinkedList<T> {
    indirect case value(T, LinkedList<T>)
    case none
}

let linkedList = LinkedList.value(10, .value(5, .value(2, .value(20, .none))))

