//
//  HomeView.swift
//  CustomisingNavigationController
//
//  Created by nakamura motoki on 2022/02/15.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView{
            
            VStack(spacing:15){
                
                ScrollView(.vertical, showsIndicators: false){
                    
                    // MARK: Smaple Images
                    ForEach(1...4, id: \.self){ index in
                        GeometryReader{ proxy in
                            let size = proxy.size
                            
                            Image("Post\(index)")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: size.width, height: size.height)
                                .cornerRadius(10)
                                .onTapGesture {
                                    NotificationCenter.default.post(name: NSNotification.Name("UPDATENAVBAR"), object: nil)
                                }
                        }
                        .frame(height: 180)
                    }// ForEach
                }// ScrollView
                .padding()
            }// VStack
            .navigationTitle("Navigation View")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
