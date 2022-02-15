//
//  Extentions.swift
//  CustomisingNavigationController
//
//  Created by nakamura motoki on 2022/02/15.
//

import SwiftUI

// MARK: Customization Options for NavigationBar

extension UINavigationController{
    
    func setNavbarColor(color: Color){
        
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
        
//        navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.yellow]
//        navigationBar.titleTextAttributes = [.foregroundColor: UIColor.yellow]
        
        // MARK: Notification Observer
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(upadateNavBar(notification:)),
                                               name: NSNotification.Name("UPDATENAVBAR"),
                                               object: nil)
    }
    
    @objc
    func upadateNavBar(notification: Notification) {
        
        print("Update Nav bar")
    }
}
