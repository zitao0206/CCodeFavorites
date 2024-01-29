//
//  DataBaseOps.swift
//  CodeFavorites
//
//  Created by lizitao on 2024/1/29.
//

import Foundation
import FMDB


class FMDBOps : CommonOpsProtocol {
     
    public init() {}
    
    func testCase() {

        DatabaseManager.shared.query()

    }
   
}

extension DatabaseManager {
    
    public func query() {
        let query = """
        SELECT DISTINCT LARARE_PNR
        FROM KURS;
        """

        do {
            guard let resultSet = try database?.executeQuery(query, values: nil) else {
                return
            }

            while resultSet.next() {
                if let firstName = resultSet.string(forColumn: "LARARE_PNR") {
                    print("人口号：\(firstName) ")
                }
            }
        } catch {
            print("Error querying data: \(error.localizedDescription)")
        }
    }

    
    func showTableData(tableName: String) {
        let query = "SELECT * FROM \(tableName);"

        do {
            guard let resultSet = try database?.executeQuery(query, values: nil) else {
                return
            }

            print("Data in table \(tableName):")
            while resultSet.next() {
                for i in 0..<resultSet.columnCount {
                    if let columnName = resultSet.columnName(for: i),
                       let columnValue = resultSet.string(forColumnIndex: i) {
                        print("\(columnName): \(columnValue)")
                    }
                }
                print("------")
            }
        } catch {
            print("Error querying table data: \(error.localizedDescription)")
        }
    }

}


class DatabaseManager {
    
    static let shared = DatabaseManager()

    private let databaseFileName = "myDatabase.sqlite"
    private var databasePath: String!

    private var database: FMDatabase?

    private init() {
        setupDatabase()
    }
    
    private func setupDatabase() {
        // 获取应用沙盒中的 Documents 目录
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

        // 构建数据库路径
        databasePath = documentsDirectory.appendingPathComponent(databaseFileName).path

        // 创建数据库实例
        database = FMDatabase(path: databasePath)

        // 打开数据库连接
        if database?.open() == true {
            print("Database opened successfully.")
            createBefattningTable()
            createKursTable()
            createPersonalTable()
            createStudentTable()
            createStudieresultatTable()
            createTerminTable()

            // 插入测试数据
            insertTestData()
        } else {
            print("Error opening database.")
        }
    }

    private func createBefattningTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS BEFATTNING (BEFATTNING_ID INTEGER PRIMARY KEY, BEFATTNING_NAMN TEXT);"

        do {
            try database?.executeUpdate(createTableQuery, values: nil)
            print("BEFATTNING table created successfully.")
        } catch {
            print("Error creating BEFATTNING table: \(error.localizedDescription)")
        }
    }

    private func createKursTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS KURS (KURS_ID INTEGER PRIMARY KEY, KURS_NAMN TEXT, LARARE_PNR TEXT, STUDIETAKT INTEGER, TERMIN_ID INTEGER, FORSTA_KURSDAG TEXT, SISTA_KURSDAG TEXT);"

        do {
            try database?.executeUpdate(createTableQuery, values: nil)
            print("KURS table created successfully.")
        } catch {
            print("Error creating KURS table: \(error.localizedDescription)")
        }
    }

    private func createPersonalTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS PERSONAL (PNR TEXT PRIMARY KEY, FORNAMN TEXT, EFTERNAMN TEXT, KON TEXT, BEFATTNING_ID INTEGER, LON INTEGER, TELNR_ARB TEXT, TELNR_HEM TEXT, EPOST_ARB TEXT, EPOST_HEM TEXT);"

        do {
            try database?.executeUpdate(createTableQuery, values: nil)
            print("PERSONAL table created successfully.")
        } catch {
            print("Error creating PERSONAL table: \(error.localizedDescription)")
        }
    }

    private func createStudentTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS STUDENT (PNR TEXT PRIMARY KEY, FORNAMN TEXT, EFTERNAMN TEXT, KON TEXT, TELNR TEXT, EPOST_ADRESS TEXT);"

        do {
            try database?.executeUpdate(createTableQuery, values: nil)
            print("STUDENT table created successfully.")
        } catch {
            print("Error creating STUDENT table: \(error.localizedDescription)")
        }
    }

    private func createStudieresultatTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS STUDIERESULTAT (STUDENT_PNR TEXT, KURS_ID INTEGER, BETYG TEXT, PRIMARY KEY (STUDENT_PNR, KURS_ID));"

        do {
            try database?.executeUpdate(createTableQuery, values: nil)
            print("STUDIERESULTAT table created successfully.")
        } catch {
            print("Error creating STUDIERESULTAT table: \(error.localizedDescription)")
        }
    }

    private func createTerminTable() {
        let createTableQuery = "CREATE TABLE IF NOT EXISTS TERMIN (TERMIN_ID INTEGER PRIMARY KEY, TERMIN_NAMN TEXT, START_DATUM TEXT, SLUT_DATUM TEXT);"

        do {
            try database?.executeUpdate(createTableQuery, values: nil)
            print("TERMIN table created successfully.")
        } catch {
            print("Error creating TERMIN table: \(error.localizedDescription)")
        }
    }

    private func insertTestData() {
        // Insert sample data into BEFATTNING table
        insertBefattningData()

        // Insert sample data into KURS table
        insertKursData()

        // Insert sample data into PERSONAL table
        insertPersonalData()

        // Insert sample data into STUDENT table
        insertStudentData()

        // Insert sample data into STUDIERESULTAT table
        insertStudieresultatData()

        // Insert sample data into TERMIN table
        insertTerminData()
    }

    private func insertBefattningData() {
        let insertDataQuery = "INSERT INTO BEFATTNING (BEFATTNING_ID, BEFATTNING_NAMN) VALUES (?, ?);"

        do {
            try database?.executeUpdate(insertDataQuery, values: [101, "Rektor"])
            try database?.executeUpdate(insertDataQuery, values: [102, "Administratör"])
            try database?.executeUpdate(insertDataQuery, values: [103, "Lärara"])
            try database?.executeUpdate(insertDataQuery, values: [104, "Hjälplärare"])

            print("Data inserted into BEFATTNING table successfully.")
        } catch {
            print("Error inserting data into BEFATTNING table: \(error.localizedDescription)")
        }
    }
    
    private func insertKursData() {
        let insertDataQuery = "INSERT INTO KURS (KURS_ID, KURS_NAMN, LARARE_PNR, STUDIETAKT, TERMIN_ID, FORSTA_KURSDAG, SISTA_KURSDAG) VALUES (?, ?, ?, ?, ?, ?, ?);"

        do {
            try database?.executeUpdate(insertDataQuery, values: [1001, "Engelska A", "19660907-9177", 100, 200901, "2009/1/20", "2009/6/8"])
            try database?.executeUpdate(insertDataQuery, values: [1002, "Matematik A", "19880619-6512", 100, 200902, "2009/8/15", "2009/12/15"])
            try database?.executeUpdate(insertDataQuery, values: [1003, "Svenska A", "19660907-9177", 100, 200901, "2009/1/11", "2009/6/18"])
            try database?.executeUpdate(insertDataQuery, values: [1004, "Fysik A", "19720221-8715", 100, 200902, "2009/8/5", "2009/12/28"])
            try database?.executeUpdate(insertDataQuery, values: [1005, "Engelska B", "19771101-8851", 100, 201001, "2010/1/18", "2010/6/8"])
            try database?.executeUpdate(insertDataQuery, values: [1006, "Matematik B", "19880619-6512", 100, 201002, "2009/8/1", "2009/12/18"])
            try database?.executeUpdate(insertDataQuery, values: [1007, "Svenska B", "19810328-1138", 100, 201001, "2010/1/6", "2010/6/9"])
            try database?.executeUpdate(insertDataQuery, values: [1008, "Fysik B", "19720221-8715", 100, 201002, "2010/8/7", "2010/12/11"])
            try database?.executeUpdate(insertDataQuery, values: [1009, "Engelska C", "19771101-8851", 100, 201101, "2011/1/5", "2011/6/10"])
            try database?.executeUpdate(insertDataQuery, values: [1010, "Engelska C (Halvfart)", "19660907-9177", 75, 201201, "2012/1/10", "2012/6/8"])
            try database?.executeUpdate(insertDataQuery, values: [1011, "Matematik C", "19670719-2112", 100, 201102, "2011/8/11", "2011/12/17"])
            try database?.executeUpdate(insertDataQuery, values: [1012, "Matematik C (Halvfart)", "19670719-2112", 75, 201201, "2012/1/8", "2012/6/9"])
            try database?.executeUpdate(insertDataQuery, values: [1013, "Svenska C", "19810328-1138", 100, 201101, "2011/1/10", "2011/6/10"])
            try database?.executeUpdate(insertDataQuery, values: [1014, "Svenska C (Halvfart)", "19660907-9177", 75, 201201, "2012/1/14", "2012/6/11"])
            try database?.executeUpdate(insertDataQuery, values: [1015, "Fysik C", "19670719-2112", 100, 201102, "2011/8/11", "2011/12/21"])
            try database?.executeUpdate(insertDataQuery, values: [1016, "Fysik C (Halvfart)", "19670719-2112", 75, 201201, "2012/1/8", "2012/6/7"])

            print("Data inserted into KURS table successfully.")
        } catch {
            print("Error inserting data into KURS table: \(error.localizedDescription)")
        }
    }
    
    private func insertPersonalData() {
        let insertDataQuery = "INSERT INTO PERSONAL (FORNAMN, EFTERNAMN, PNR, KON, BEFATTNING_ID, LON, TELNR_ARB, TELNR_HEM, EPOST_ARB, EPOST_HEM) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);"

        do {
            try database?.executeUpdate(insertDataQuery, values: ["Linnéa", "Hall", "19620125-1332", "K", 101, 56700, "010-8726356", "071-1702376", "halli@larare.se", "halli@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Margareta", "Byström", "19720221-8715", "K", 103, 38500, "010-7615198", "071-2656123", "bysma@larare.se", "bysma@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Elisabeth", "Nordgren", "19760122-9614", "K", 102, 42100, "010-8638346", "071-2763837", "norel@larare.se", "norel@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Ingeborg", "Strid", "19810328-1138", "K", 103, 39100, "010-3176285", "071-7823638", "strin@larare.se", "strin@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Viola", "Lantz", "19880619-6512", "K", 103, 37900, "010-9971576", "071-7652352", "lanvi@larare.se", "lanvi@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Jesper", "Svanberg", "19841014-2515", "M", 102, 40300, "010-1557236", "071-8762323", "svaje@larare.se", "svaje@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Lucas", "Malmqvist", "19660907-9177", "M", 103, 39100, "010-7723986", "071-1573623", "mallu@larare.se", "mallu@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Linus", "Sjölund", "19670719-2112", "M", 103, 39400, "010-4159626", "071-6682367", "sjöli@larare.se", "sjöli@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Robin", "Lindvall", "19771101-8851", "M", 103, 41000, "010-4417694", "071-9717536", "linro@larare.se", "linro@hem.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Simon", "Wall", "19800827-6139", "M", 104, 39300, "010-4612761", "071-1726350", "walsi@larare.se", "walsi@hem.se"])

            print("Data inserted into PERSONAL table successfully.")
        } catch {
            print("Error inserting data into PERSONAL table: \(error.localizedDescription)")
        }
    }

    private func insertStudentData() {
        let insertDataQuery = "INSERT INTO STUDENT (FORNAMN, EFTERNAMN, PNR, KON, TELNR, EPOST_ADRESS) VALUES (?, ?, ?, ?, ?, ?);"

        do {
            try database?.executeUpdate(insertDataQuery, values: ["Malin", "Fransson", "19640323-0123", "K", "071-8268351", "frama@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Sandra", "Eriksson", "19610416-1246", "K", "071-1783833", "erisa@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Jessica", "Stenberg", "19770520-7286", "K", "071-9834165", "steje@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Annika", "Björkman", "19790505-8981", "K", "071-9273534", "bjöan@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Emelie", "Linder", "19840503-0623", "K", "071-8972634", "linem@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Ingvar", "Norman", "19810404-8912", "M", "071-7239726", "norin@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Ingemar", "Berntsson", "19750917-9752", "M", "071-8762356", "berin@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Olof", "Bergman", "19651223-6571", "M", "071-4516239", "berol@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Emanuel", "Nygren", "19690823-1772", "M", "071-5930273", "nygem@student.se"])
            try database?.executeUpdate(insertDataQuery, values: ["Vilhelm", "Ekberg", "19750723-4617", "M", "071-7692063", "ekbvi@student.se"])

            print("Data inserted into STUDENT table successfully.")
        } catch {
            print("Error inserting data into STUDENT table: \(error.localizedDescription)")
        }
    }
    
    private func insertStudieresultatData() {
        let insertDataQuery = "INSERT INTO STUDIERESULTAT (STUDENT_PNR, KURS_ID, BETYG) VALUES (?, ?, ?);"

        do {
            try database?.executeUpdate(insertDataQuery, values: ["19640323-0123", 1002, "MVG"])
            try database?.executeUpdate(insertDataQuery, values: ["19640323-0123", 1006, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19640323-0123", 1011, "MVG"])
            try database?.executeUpdate(insertDataQuery, values: ["19770520-7286", 1001, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19770520-7286", 1005, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19770520-7286", 1004, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19770520-7286", 1008, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19790505-8981", 1003, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19790505-8981", 1007, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19790505-8981", 1014, "MVG"])
            try database?.executeUpdate(insertDataQuery, values: ["19840503-0623", 1001, "U"])
            try database?.executeUpdate(insertDataQuery, values: ["19840503-0623", 1002, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19750917-9752", 1002, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19750917-9752", 1004, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19750917-9752", 1006, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19651223-6571", 1001, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19651223-6571", 1005, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19651223-6571", 1009, "U"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1001, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1002, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1003, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1004, "VG"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1005, "G"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1006, "U"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1007, "U"])
            try database?.executeUpdate(insertDataQuery, values: ["19750723-4617", 1008, "G"])

            print("Data inserted into STUDIERESULTAT table successfully.")
        } catch {
            print("Error inserting data into STUDIERESULTAT table: \(error.localizedDescription)")
        }
    }

    private func insertTerminData() {
        let insertDataQuery = "INSERT INTO TERMIN (TERMIN_ID, TERMIN_NAMN, START_DATUM, SLUT_DATUM) VALUES (?, ?, ?, ?);"

        do {
            try database?.executeUpdate(insertDataQuery, values: [200801, "VT08", "2008/1/7", "2008/6/6"])
            try database?.executeUpdate(insertDataQuery, values: [200802, "HT08", "2008/8/4", "2008/12/26"])
            try database?.executeUpdate(insertDataQuery, values: [200901, "VT09", "2009/1/5", "2009/6/5"])
            try database?.executeUpdate(insertDataQuery, values: [200902, "HT09", "2009/8/3", "2009/12/25"])
            try database?.executeUpdate(insertDataQuery, values: [201001, "VT10", "2010/1/4", "2010/6/4"])
            try database?.executeUpdate(insertDataQuery, values: [201002, "HT10", "2010/8/2", "2010/12/28"])
            try database?.executeUpdate(insertDataQuery, values: [201101, "VT11", "2011/1/3", "2011/6/3"])
            try database?.executeUpdate(insertDataQuery, values: [201102, "HT11", "2011/8/1", "2011/12/27"])
            try database?.executeUpdate(insertDataQuery, values: [201201, "VT12", "2012/1/2", "2012/6/1"])
            try database?.executeUpdate(insertDataQuery, values: [201202, "HT12", "2012/8/3", "2012/12/26"])
            try database?.executeUpdate(insertDataQuery, values: [201301, "VT13", "2013/1/7", "2013/6/7"])
            try database?.executeUpdate(insertDataQuery, values: [201302, "HT13", "2013/8/5", "2013/12/24"])

            print("Data inserted into TERMIN table successfully.")
        } catch {
            print("Error inserting data into TERMIN table: \(error.localizedDescription)")
        }
    }



}






