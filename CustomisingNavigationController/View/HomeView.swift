//
//  HomeView.swift
//  CustomisingNavigationController
//
//  Created by nakamura motoki on 2022/02/15.
//

import SwiftUI

struct HomeView: View {
    // NavgationBarの色を管理する
    @State private var barColor: Color = .init(white: 0)
    // NavgationBarTitleの色を管理する
    @State private var barTextColor: Color = .primary
    
    var body: some View {
        NavigationView{
            // 縦方向にスクロール可能
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
                    
                    Picker("",selection:$barTextColor){
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
                    }
                    .pickerStyle(.segmented)
                    .labelsHidden()
                    
                    // MARK: Smaple Images
                    ForEach(1...4, id: \.self){ index in
                    // 画像タップ時に画面遷移
                        NavigationLink{
                            Text("Detail View")
                                .navigationTitle("Detail")
                        }label: {
                            //画像のサイズについて
                            GeometryReader{ proxy in
                                let size = proxy.size
                                
                                Image("Post\(index)")
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: size.width, height: size.height)
                                    .cornerRadius(10)
                            }
                            .frame(height: 180)
                        }// NavigationLink
                    }// ForEach
                }// VStack
                .padding()
            }// ScrollView
            .navigationTitle("Navigation View")
            .toolbar{
                //resetNavBarメソッドを呼び出して、NavigationBarの色を元に戻す
                Button("RESET"){
                    resetNavBar()
                }
            }// .toolbar
        }// NavigationView
        // Updating Colors
        // onChangeでbarColorの値の変化を監視する。
        // Pickerで色を選択するとbarColorの値が変化する。
        // barColorの値が変化すると、NavgationBarの色を変更するsetNavbarColorメソッドが呼び出される。
        // setNavbarColorメソッドの引数colorに選択した色が格納されているbarColorを渡すことで色を変化させる。
        .onChange(of: barColor){ newValue in
            setNavbarColor(color: barColor)
        }
        // onChangeでbarTextColorの値の変化を監視する。
        // Pickerで色を選択するとbarTextColorの値が変化する。
        // barTextColorの値が変化すると、NavgationBarTitleの色を変更するsetNavbarTitleColorメソッドが呼び出される。
        // setNavbarTitleColorメソッドの引数colorに選択した色が格納されているbarTextColorを渡すことで色を変化させる。
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
