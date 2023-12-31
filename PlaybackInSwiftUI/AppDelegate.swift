//
//  AppDelegate.swift
//  PlaybackInSwiftUI
//
//  Created by Emma Walker - TVandMobile Platforms - Core Engineering on 10/11/2023.
//
import SwiftUI
import Foundation
import UIKit

class AppDelegate: NSObject, UIApplicationDelegate {
        
    static var orientation = UIInterfaceOrientationMask.all {
        didSet {
                    if #available(iOS 16.0, *) {
                        UIApplication.shared.connectedScenes.forEach { scene in
                            if let windowScene = scene as? UIWindowScene {
                                windowScene.requestGeometryUpdate(.iOS(interfaceOrientations: orientation))
                            }
                        }
                        UIViewController.attemptRotationToDeviceOrientation()
                    } else {
                        if orientation == .landscape {
                            UIDevice.current.setValue(UIInterfaceOrientation.landscapeRight.rawValue, forKey: "orientation")
                        } else {
                            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
                        }
                    }
                }
    }
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        return true
    }
    
    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientation
    }
}
