import UIKit
import Combine



// MARK: - filter
//let numbersPublisher = (1...10).publisher
//
//let evenNumberPublisher = numbersPublisher.filter { $0 % 2 == 0}
//
//let cancellable = evenNumberPublisher.sink { value in
//    print(value)
//}



// MARK: - compactMap
//let stringsPublisher = ["1", "2", "3", "4", "A"].publisher
//
//let numbersPublisher = stringsPublisher.compactMap { Int($0) }
//
//let cancellable = numbersPublisher.sink { value in
//    print(value)
//}



// MARK: - debounce
//let textPublisher = PassthroughSubject<String, Never>()
//
//let debouncedPublisher = textPublisher.debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
//
//let cancellable = debouncedPublisher.sink { value in
//    print(value)
//}
//
//textPublisher.send("A")
//textPublisher.send("B")
//textPublisher.send("C")
//textPublisher.send("D")
//textPublisher.send("E")
//textPublisher.send("F")



// MARK: - throttle
let textPublisher = PassthroughSubject<String, Never>()

let debouncedPublisher = textPublisher.throttle(for: .seconds(0.5), scheduler: DispatchQueue.main, latest: false)

let cancellable = debouncedPublisher.sink { value in
    print(value)
}

textPublisher.send("A")
textPublisher.send("B")
textPublisher.send("C")
textPublisher.send("D")
textPublisher.send("E")
textPublisher.send("F")
