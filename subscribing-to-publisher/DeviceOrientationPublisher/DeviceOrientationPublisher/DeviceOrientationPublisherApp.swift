//
//  DeviceOrientationPublisherApp.swift
//  DeviceOrientationPublisher
//
//  Created by Ussama Irfan on 03/03/25.
//

import SwiftUI
import Combine

@main
struct DeviceOrientationPublisherApp: App {
    
    private var cancellables: Set<AnyCancellable> = []
    
    init() {
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .sink { _ in
                let currentOrientation = UIDevice.current.orientation
                print(currentOrientation)
            }
            .store(in: &cancellables)
    }
    
    var body: some Scene {
        
        WindowGroup {
            ContentView()
        }
    }
}
