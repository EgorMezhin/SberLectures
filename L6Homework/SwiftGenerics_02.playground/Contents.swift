// ДЗ: Реализовать базовый протокол для контейнеров.
// Контейнеры должны отвечать, сколько они содержат элементов,
// добавлять новые элементы и возвращать элемент по индексу.
// На основе базового протокола реализовать универсальный связанный список
// и универсальную очередь (FIFO) в виде структуры или класса.
//
import Foundation

protocol Container {
    associatedtype Item
    
    var items: [Item] { get set }
    var count: Int { get }
    mutating func append(_ item: Item)
    subscript(i: Int) -> Item { get }
}

//Реализация Linked List
//
class Node<T> {
    var value: T
    var next: Node<T>?
    weak var previous: Node<T>?
    
    init(value: T) {
        self.value = value
    }
}

class LinkedList<T>: Container {
    typealias Item = T
    
    private var head: Node<Item>?
    private var tail: Node<Item>?
    
    var items: [Item] = []
    var count: Int {
        var currentHead: Node? = head
        var count: Int = 0
        
        if currentHead == nil {
            return count
        }
        
        while currentHead != nil {
            count += 1
            currentHead = currentHead?.next
        }
        
        return count
    }

    var isEmpty: Bool {
        return head == nil
    }
    
    var first: Node<Item>? {
        return head
    }
    
    var last: Node<Item>? {
        return tail
    }
    
    subscript(i: Int) -> Item {
        items[i]
    }
    
    func append(_ item: Item) {
        let newNode = Node(value: item)
        if let tailNode = tail {
            newNode.previous = tailNode
            tailNode.next = newNode
        }
        else {
            head = newNode
        }
        tail = newNode
    }
    
    func nodeAt(index: Int) -> Node<Item>? {
        if index >= 0 {
            var node = head
            var i = index
            while node != nil {
                if i == 0 { return node }
                i -= 1
                node = node!.next
            }
        }
        return nil
    }
}

// Реализиация очереди (FIFO)
//
class Queue<T>: Container {
    typealias Item = T
    
    var items: [Item] = []
    
    var count: Int {
        items.count
    }
    
    func append(_ item: T) {
        items.append(item)
    }
    
    func remove() -> T? {
        guard !items.isEmpty else { return nil }
        return items.removeFirst()
    }
    
    subscript(i: Int) -> T {
        items[i]
    }
}




    
    

