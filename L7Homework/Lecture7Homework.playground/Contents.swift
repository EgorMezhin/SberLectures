// ДЗ: Создать массив строк, реализовать функции checkHomework и checkTask
// Пример - это строка формата «32 + 16 = 48». В нём два числа слева от равно,
// одно число справа. Операции: сложение и вычитание.
//
// Есть функция checkHomework, которая:
// 1. Принимает массив примеров
// 2. И возвращает:
//      1. Если больше 75% ошибок в примерах - функция возвращает список всех примеров
//         с ошибками и подписью «делай заново»
//      2. Если пример решён верно - возвращает строку «молодец»
//      3. Если нет примеров - возвращает строку «нет примеров»
// 3. Если ей на вход дать хотя бы один невалидный пример - выводит "переделывай"
//    и не оценивает другие примеры
//

struct Constants {
    static let operations = ["+", "-"]
    static let equal = "="
}

struct CalculationError: Error {
    var localizedDescription: String
}

enum CalculationResult<Failure> {
    case success(message: String)
    case failure(error: Failure)
    case invalid(message: String)
    case empty(message: String)
}

typealias TestResult = CalculationResult<CalculationError>

let arrayOfExamples: [String] =
    ["32 + 16 = 48",
     "14 + 1 = 16",
     "41 - 2 = 39",
     "2 - 2 = 0",
     "54 - 44 = 10",
     "74 + 0 = 74",
     "22 + 11 = 33",
     "1 + 99 = 100",
     "44 - 12 = 33",
     "0 + 221 = 221"]

func checkHomework(of array: [String]) -> TestResult {
    var countOfCorrectAnswers = 0
    var answer = 0
    
    guard !array.isEmpty else {
        return .empty(message: "нет примеров")
    }
    
    for example in array {
        let exampleByParts = example.split(separator: " ")
        let operation = exampleByParts[1]
        
        guard exampleByParts.count == 5,
              let firstNumber = Int(exampleByParts[0]),
              let secondNumber = Int(exampleByParts[2]),
              let result = Int(exampleByParts[4]),
              Constants.operations.contains(String(operation)),
              Constants.equal == exampleByParts[3]
        else {
            return .invalid(message: "переделывай")
        }
        if operation == "+" {
            answer = firstNumber + secondNumber
        } else if operation == "-" {
            answer = firstNumber - secondNumber
        }
        if result == answer {
           countOfCorrectAnswers += 1
        }
        
    }
    
    if Double(countOfCorrectAnswers) / Double(array.count) < 0.75 {
        let error = CalculationError(localizedDescription: "делай заново")
        return .failure(error: error)
    } else {
        return .success(message: "молодец")
    }
}

let example = checkHomework(of: arrayOfExamples)
print(example)

//
// Есть функция checkTask:
// 1. Она принимает пример
// 2. Если это не пример - надо кинуть исключение
// 3. Если пример решён правильно - возвращаем строку с похвалой.
//    Если нет - возвращаем ошибку с правильным ответом
//

enum ExampleResult<Value, FailureValue> {
    case success(result: Value, message: String)
    case failure(error: FailureValue)
    case warning(answer: Value, correctAnswer: Value, message: String)
}

enum ExampleError: Error {
    case error(message: String)
}

let stringForTest = "3 + 6 = 9"

typealias Result = ExampleResult<Int, ExampleError>

func checkTask(_ example: String) throws -> Result {
    let exampleByParts = example.split(separator: " ")
    let operation = exampleByParts[1]
    var answer = 0

    guard exampleByParts.count == 5
    else {
        let error = ExampleError.error(message: "Invalid example")
        throw error
    }
    guard let firstNumber = Int(exampleByParts[0]),
          let secondNumber = Int(exampleByParts[2]),
          let result = Int(exampleByParts[4])
    else {
        let error = ExampleError.error(message: "Invalid operands")
        throw error
    }
    guard Constants.operations.contains(String(operation))
    else {
        let error = ExampleError.error(message: "Invalid operator")
        throw error
    }
    guard Constants.equal == exampleByParts[3]
    else {
        let error = ExampleError.error(message: "Invalid equal sign")
        throw error
    }
    if operation == "+" {
        answer = firstNumber + secondNumber
    } else if operation == "-" {
        answer = firstNumber - secondNumber
    }
    if result == answer {
        return .success(result: result, message: "Good job!")
    } else {
        return .warning(answer: answer, correctAnswer: result, message: "Wrong answer")
    }
}

do {
    let example = try checkTask(stringForTest)
    print(example)
} catch ExampleError.error(let message) {
    print("Error: \(message)")
}

