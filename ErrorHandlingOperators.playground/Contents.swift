import UIKit
import Combine


enum SampleError: Error {
    case operationFailed
}



// MARK: - tryMap
//let numbersPublisher = [1,2,3,4,5,6].publisher
//
//let transformedPublisher = numbersPublisher
//    .tryMap { value in
//        if value == 3 {
//            throw SampleError.operationFailed
//        }
//        
//        return value
//    }
//    .catch { error in
//        print(error)
//        return Just(0)
//    }
//
//transformedPublisher.sink { value in
//    print(value)
//}



// MARK: - replaceError with single value
//let numbersPublisher = [1,2,3,4,5,6].publisher
//
//let transformedPublisher = numbersPublisher
//    .tryMap { value in
//        if value == 3 {
//            throw SampleError.operationFailed
//        }
//        
//        return value * 2
//    }
//    .replaceError(with: -1)
//
//
//let cancellable = transformedPublisher.sink { value in
//    print(value)
//}



// MARK: - replaceError with another publisher
//let numbersPublisher = [1,2,3,4,5,6].publisher
//
//let fallbackPublisher = Just(-1)
//
//let transformedPublisher = numbersPublisher
//    .tryMap { value in
//        if value == 3 {
//            throw SampleError.operationFailed
//        }
//        return Just(value * 2)
//    }
//    .replaceError(with: fallbackPublisher)
//
//let cancellable = transformedPublisher.sink { publisher in
//    let _ = publisher.sink { value in
//        print(value)
//    }
//}



// MARK: - retry
let publisher = PassthroughSubject<Int, Error>()

let retriedPublisher = publisher
    .tryMap { value in
        if value == 3 {
            throw SampleError.operationFailed
        }
        return value
    }
    .retry(2)

let cancellable = retriedPublisher.sink { completion in
    switch completion {
        case .finished:
            print("Pubisher has completed.")
        case .failure(let error):
            print("Publisher failed with error \(error)")
    }
} receiveValue: { value in
    print(value)
}

publisher.send(1)
publisher.send(2)
publisher.send(3) // failed
publisher.send(4)
publisher.send(5)
publisher.send(3) // failed
publisher.send(6)
publisher.send(7)
publisher.send(3) // failed
publisher.send(8)
