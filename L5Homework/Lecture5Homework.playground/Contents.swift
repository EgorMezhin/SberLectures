import Foundation
// ДЗ: Реализовать все возможные виды Method dispatch

//
// Direct Dispatch
// Плюсы: самый быстрый
// Минусы: отсутствует полиморфизм и наследование
//
// Примеры Direct Dispatch
//
struct Human {
    func walk() {
        print("I'm walking now.")
    }
}

var mike = Human()
mike.walk()

//
// Witness Table Dispatch
// Плюсы: реализует полиморфизм подтипов
// Минусы: медленее Direct Dispatch, отсутствует наследование
//
// Примеры Witness Table Dispatch
//
class Circle { }

protocol Drawable {
    func draw()
    func erase()
}

extension Circle: Drawable {
    func draw() {
        print("draw a circle")
    }
    func erase() {
        print("erase the circle")
    }
}

let drawable: Drawable = Circle()
drawable.draw()

//
// Virtual Table Dispatch
// Плюсы: реализует полиморфизм и наследование
// Минусы: скорость как у Witness Table, но есть дополнительные затраты при компиляции
//
// Примеры Virtual Table Dispatch
//
class Dog {
    func bark() {
        print("WOOF - WOOF")
    }
}

class Puppy: Dog {
    override func bark() {
        print("woof - woof")
    }
    func play() { }
}

let puppy = Puppy()
puppy.bark()

//
// Message Dispatch
// Плюсы: KVC/KVO, Method swizzling
// Минусы: самый медленный
//
// Примеры Message Dispatch
//

class Pet: NSObject {
    dynamic func sleep() {
        print("Zzz...")
    }
    dynamic func voice() {
    }
}

class Cat: Pet {
    override func voice() {
        print("Meow Meow")
    }
}

var murka = Cat()
murka.voice()
