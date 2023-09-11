//
//  ContentView.swift
//  CCodeFavorites
//
//  Created by lizitao on 2023/9/11.
//

import SwiftUI

struct ContentView: View {
    
    public init() {}
    
    public var body: some View {
        NavigationView {
            List {
                NavigationLink.init("line 1", destination: Text("Content of line 1"))
                NavigationLink.init("line 2", destination: Text("Content of line 2"))
            }
        }
        .accentColor(.red)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
