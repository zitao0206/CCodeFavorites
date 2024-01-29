//
//  DataBaseOpsTest.swift
//  CodeFavorites
//
//  Created by lizitao on 2024/1/29.
//

import Foundation

public struct DataBaseOpsTest : CommonOpsProtocol {
    
    public init() {}

    public func testCase() {
        let fmdb = FMDBOps()
        fmdb.testCase()
    }
}
