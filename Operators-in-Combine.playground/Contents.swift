import UIKit
import Combine



// MARK: - map
//
//let numbersPublisher = (1...5).publisher
//
//let squaredPublisher = numbersPublisher.map { "Item# \($0)" }
//
//let cancellable = squaredPublisher.sink { value in
//    print(value)
//}



// MARK: - flatMap
//let namePublisher = ["John", "Mary", "Steven"].publisher
//
//let flattedNamePublisher = namePublisher.flatMap { name in
//    name.publisher
//}
//
//let cancellable = flattedNamePublisher
//    .sink { char in
//        print(char)
//    }
//



// MARK: - merge
let publisher1 = [1,2,3].publisher
let publisher2 = [4,5,6].publisher
let publisher3 = ["A", "B"].publisher

let mergedPublisher = Publishers.Merge(publisher1, publisher2)

let cancellable = mergedPublisher.sink { value in
    print(value)
}
