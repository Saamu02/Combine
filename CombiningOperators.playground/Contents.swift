import UIKit
import Combine

// MARK: - combineLatest
//let publisher1 = CurrentValueSubject<Int, Never>(1)
//let publisher2 = CurrentValueSubject<String, Never>("Hello World")
//
//let combinedPublisher = publisher1.combineLatest(publisher2)
//
//let cancellable = combinedPublisher.sink { value1, value2 in
//    print("Value 1: \(value1), Value 2: \(value2)")
//}
//
//publisher1.send(3)
//publisher2.send("Introduction to Combine")



// MARK: -  zip
//let publisher1 = [1,2,3,4].publisher
//let publisher2 = ["A", "B", "C", "D", "E"].publisher
//let publisher3 = ["John", "Doe", "Mary", "Steven"].publisher
//
////let zippedPublisher = publisher1.zip(publisher2)
//
//let zippedPublisher = Publishers.Zip3(publisher1, publisher2, publisher3)
//
//let cancellable = zippedPublisher.sink { value in
//    print("\(value.0), \(value.1), \(value.2)")
//}



// MARK: -  switchToLatest
let outerPublisher = PassthroughSubject<AnyPublisher<Int, Never>, Never>()
let innerPublisher1 = CurrentValueSubject<Int, Never>(1)
let innerPublisher2 = CurrentValueSubject<Int, Never>(2)

let cancellable = outerPublisher
    .switchToLatest()
    .sink { value in
        print(value)
}

outerPublisher.send(AnyPublisher(innerPublisher1))
innerPublisher1.send(10)

outerPublisher.send(AnyPublisher(innerPublisher2))
innerPublisher2.send(20)
innerPublisher2.send(100)
