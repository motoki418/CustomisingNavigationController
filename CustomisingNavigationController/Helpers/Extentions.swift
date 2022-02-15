//
//  .swift
//  CustomisingNavigationController
//
//  Created by nakamura motoki on 2022/02/15.
//

import SwiftUI

// MARK: Customization Options for NavigationBar

extension View{
    
    func setNavbarColor(color: Color){
        // MARK: Updating Nav Bar Color
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil,userInfo: [
            //Sending Color
                "color": color
            ])
        }
        
    }
    
    func resetNavBar() {
        // MARK: Resetting Nav Bar
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil)
        }
    }
    
    func setNavTitleColor(color: Color){
        
    }
}

// MARK: NavigationController helpers
extension UINavigationController{
    
    open override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Since it's base navigation Controller load method
        // so what ever changes done here will reflect on navigation bar
        // MARK: Notification Observer
        //通知先を指定
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(upadateNavBar(notification:)),
                                               name: NSNotification.Name("UPDATENAVBAR"),
                                               object: nil)
    }
    
    @objc
    func upadateNavBar(notification: Notification) {
        
        if let info = notification.userInfo{
        let color = info["color"] as! Color
            
            // MARK: Upadating Nav Bar Color
            let appearance = UINavigationBarAppearance()
            appearance.backgroundColor = UIColor(color)
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
        else{
            // MARK: Reset Nav Bar
            let appearance = UINavigationBarAppearance()
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = appearance
            navigationBar.compactAppearance = appearance
        }
    }
}
