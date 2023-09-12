//
//  CCodeFavoritesApp.swift
//  CCodeFavorites
//
//  Created by lizitao on 2023/9/11.
//

import SwiftUI
import CodeFavorites

@main
struct CCodeFavoritesApp: App {
    
    @StateObject private var algorithmTestModel = AlgorithmTestModel()
    @StateObject private var commonOpsTestModel = CommonOpsTestModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: setup)
        }
    }
    
    func setup() {
//        algorithmTestModel.testCase()
//        commonOpsTestModel.testCase()
//        exit(0)
    }
}


class AlgorithmTestModel: ObservableObject {
    
    func testCase() {
        FavoritesTest().testCase()
        TopicsTest().testCase()
        
    }
}

class CommonOpsTestModel: ObservableObject {
    
    func testCase() {
        CommonOpsTest().testCase()
    }
}


