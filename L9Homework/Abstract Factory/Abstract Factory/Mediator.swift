//
//  Mediator.swift
//  Abstract Factory
//
//  Created by Egor Lass on 21.05.2021.
//

protocol Mediator: AnyObject {

    func notify(sender: BaseComponent, event: String)
}

class ConcreteMediator: Mediator {

    private var component1: Component1
    private var component2: Component2

    init(_ component1: Component1, _ component2: Component2) {
        self.component1 = component1
        self.component2 = component2

        component1.update(mediator: self)
        component2.update(mediator: self)
    }

    func notify(sender: BaseComponent, event: String) {
        if event == "Used" {
            print("Mediator reacts on Used")
            self.component2.used = true
            self.component2.new = false
        }
        if (event == "New") {
            print("Mediator reacts on New")
            self.component2.used = false
            self.component2.new = true
            
        }
    }
}

class BaseComponent {
    fileprivate weak var mediator: Mediator?

    init(mediator: Mediator? = nil) {
        self.mediator = mediator
    }
    func update(mediator: Mediator) {
        self.mediator = mediator
    }
}


class Component1: BaseComponent {
    func selectNew() {
        print("New selected")
        mediator?.notify(sender: self, event: "New")
    }
    func selectUsed() {
        print("Used selected")
        mediator?.notify(sender: self, event: "Used")
    }
}

class Component2: BaseComponent {
    var used = false
    var new = true
}
