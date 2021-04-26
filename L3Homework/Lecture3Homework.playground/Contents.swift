// ДЗ: Реализовать COW в своей структуре со свойством reference type (isKnownUniquelyReferenced)
//
import UIKit

// Создание структуры
//
struct User {
    private var _chats = ChatHistory()
    var chats: ChatHistory {
        mutating get {
            if !isKnownUniquelyReferenced(&_chats) {
                _chats = _chats.copy()
            }
            return _chats
        }
        set {
            _chats = newValue
        }
    }
}

// Создание reference type свойства для структуры User
//
class ChatHistory {
    var messages: String = ""
    
    func copy() -> ChatHistory {
        let copy = ChatHistory()
        copy.messages = self.messages
        return copy
    }
}

// Создаем первый экземпляр класса User
//
var mike = User()
mike.chats.messages = "Hello!"

// Создаем второй экземпляр класса User
//
var taylor = User()
taylor.chats = mike.chats

// При изменении свойства messages у экземпляра mike, свойство messages экзмепляра taylor не изменилось.
// Следовательно copy on write работает.
//
mike.chats.messages = "Goodbye!"
print(mike.chats.messages)
print(taylor.chats.messages)

