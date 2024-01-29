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
    
    @StateObject private var commonOpsTestModel = CommonOpsTestModel()
    @StateObject private var algorithmTestModel = AlgorithmTestModel()
    @StateObject private var dataBaseTestModel = DataBaseTestModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onAppear(perform: setup)
        }
    }
    
    func setup() {
//        commonOpsTestModel.testCase()
//        algorithmTestModel.testCase()
        dataBaseTestModel.testCase()
        exit(0)
    }
}

class CommonOpsTestModel: ObservableObject {
    
    func testCase() {
        CommonOpsTest().testCase()
    }
}

class AlgorithmTestModel: ObservableObject {
    
    func testCase() {
        FavoritesTest().testCase()
        TopicsTest().testCase()
        InterviewTest().testCase()
    }
}

class DataBaseTestModel: ObservableObject {
    
    func testCase() {
        DataBaseOpsTest().testCase()
    }
}




