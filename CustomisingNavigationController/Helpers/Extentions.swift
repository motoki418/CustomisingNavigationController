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
    // Resetボタンがタップされると呼び出される
    func resetNavBar() {
        // MARK: Resetting Nav Bar
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil)
        }
    }
    
    func setNavbarTitleColor(color: Color){
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01){
            NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil,userInfo: [
                //Sending Color
                "color": color,
                "forTitle": true
            ])
        }
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
            
            if let _ = info["forTitle"]{
                
                // MARK: Title Color
                // Update color in Appearnce
                navigationBar.standardAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor(color)]
                navigationBar.standardAppearance.titleTextAttributes = [.foregroundColor: UIColor(color)]
                
                navigationBar.scrollEdgeAppearance?.largeTitleTextAttributes = [.foregroundColor: UIColor(color)]
                navigationBar.scrollEdgeAppearance?.titleTextAttributes = [.foregroundColor: UIColor(color)]
                
                navigationBar.compactAppearance?.largeTitleTextAttributes = [.foregroundColor: UIColor(color)]
                navigationBar.compactAppearance?.titleTextAttributes = [.foregroundColor: UIColor(color)]
                
                return
            }
            
            
            if color == .clear{
                
                // Transparent Nav Bar
                let transparentAppearance = UINavigationBarAppearance()
                transparentAppearance.configureWithTransparentBackground()
                
                navigationBar.standardAppearance = transparentAppearance
                navigationBar.scrollEdgeAppearance = transparentAppearance
                navigationBar.compactAppearance = transparentAppearance
                
                return
            }
            
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
            
            // スクロールしても色を反映させ続ける
            let transparentAppearance = UINavigationBarAppearance()
            transparentAppearance.configureWithTransparentBackground()
            
            navigationBar.standardAppearance = appearance
            navigationBar.scrollEdgeAppearance = transparentAppearance
            navigationBar.compactAppearance = appearance
        }
    }
}
