//
//  HomeView.swift
//  CustomisingNavigationController
//
//  Created by nakamura motoki on 2022/02/15.
//

import SwiftUI

struct HomeView: View {
    @State private var barColor: Color = .init(white: 0)
    @State private var barTextColor: Color = .primary
    var body: some View {
        NavigationView{
            
            ScrollView(.vertical, showsIndicators: false){
                
                VStack(spacing:15){
                    
                    Text("Navigation Bar Color")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Picker(selection: $barColor){
                        
                        // Sample Colors
                        Text("Clear")
                            .tag(Color.clear)
                        Text("Pink")
                            .tag(Color.pink)
                        Text("Purple")
                            .tag(Color.purple)
                        Text("Orange")
                            .tag(Color.orange)
                        Text("Cyan")
                            .tag(Color.cyan)
                    } label: {
                      
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    Text("Navigation Bar Text Color")
                        .font(.caption)
                        .foregroundColor(.gray)
                        .frame(maxWidth: .infinity,alignment: .leading)
                    
                    Picker(selection:$barTextColor){
                        // Sample Colors
                        Text("Primary")
                            .tag(Color.primary)
                        Text("White")
                            .tag(Color.white)
                        Text("Black")
                            .tag(Color.black)
                        Text("Orange")
                            .tag(Color.orange)
                        Text("Green")
                            .tag(Color.green)
                    } label: {
                       
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    // MARK: Smaple Images
                    ForEach(1...4, id: \.self){ index in
                    
                        NavigationLink{
                            Text("Detail View")
                                .navigationTitle("Detail")
                        }label: {
                            GeometryReader{ proxy in
                                let size = proxy.size
                                
                                Image("Post\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .cornerRadius(10)
//                                //　画像をタップするとNavigationBarを黄色に
//                                    .onTapGesture {
//                                        setNavbarColor(color: .clear)
//                                    }
                            }
                            .frame(height: 180)
                        }
                    }// ForEach
                }// VStack
                .padding()
            }// ScrollView
            .navigationTitle("Navigation View")
            .toolbar{
                //NavigationBarの色をもとに戻す
                Button("RESET"){
                    resetNavBar()
                }
            }// .toolbar
        }// NavigationView
        // Updating Colors
        .onChange(of: barColor){ newValue in
            setNavbarColor(color: barColor)
        }
        .onChange(of: barTextColor){ newValue in
            setNavbarTitleColor(color: barTextColor)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
