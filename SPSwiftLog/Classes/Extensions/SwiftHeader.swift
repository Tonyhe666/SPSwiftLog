//
//  SwiftHeader.swift
//  SwiftLog
//
//  Created by heliang on 2024/2/22.
//

import Foundation

public struct Constants {
    // 判断是否是测试版
    public static var isDevlopment: Bool {
        #if DEVELOPMENT
            return true
        #else
            return false
        #endif
    }
    
    public static var width: CGFloat {
        return UIScreen.main.bounds.width
    }
    public static var height: CGFloat {
        return UIScreen.main.bounds.height
    }
    
    public static var keyWindow: UIWindow? {
        return UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0})
            .first?.windows.filter({$0.isKeyWindow}).first
    }
    
    public static var windowScene: UIWindowScene? {
        return UIApplication.shared.connectedScenes
            .filter({$0.activationState == .foregroundActive})
            .map({$0 as? UIWindowScene})
            .compactMap({$0}).first
    }
    
    public static var statusBarHeight: CGFloat {
        return keyWindow?.windowScene?.statusBarManager?.statusBarFrame.height ?? (iPhoneX ? 44.0 : 20)
    }
    
    public static var navigationBarHeight: CGFloat {
        return statusBarHeight + 44
    }
    
    public static var tabBarHeight: CGFloat {
        return iPhoneX ? 83.0 : 49.0
    }
    
    // 是否是刘海屏
    public static var iPhoneX: Bool {
        guard let w = keyWindow else {
            return false
        }
        
        guard #available(iOS 11.0, *) else {
            return false
        }
        
        return w.safeAreaInsets.bottom > 0.0
    }
    
    public static var ipad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
}
