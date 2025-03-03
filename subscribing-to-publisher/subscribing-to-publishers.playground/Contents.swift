import Foundation
import Combine

let timerPublisher = Timer.publish(every: 1, on: .main, in: .common)

let cancellable = timerPublisher.autoconnect().sink { timestamp in
    print("Timestamp: \(timestamp)")
}

DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
    cancellable.cancel()
}
 

