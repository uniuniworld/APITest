//
//  ScheduleData.swift
//  APITest
//
//  Created by t_kirifu on 2021/02/02.
//

import Foundation

struct ScheduleData: Codable {
    
//    let nknk: Nknk?
//    let testlist: [String]?
    let data: Years?
}

struct Nknk: Codable {
    //let nnn: String
    let testdic: [Test]?
}

struct Test: Codable {
    let aaa: String
    let bbb: String
    let ccc: String
}

struct Years: Codable {
    let years: [Year]?
}

struct Year: Codable {
    let year: String?
    let months: [Month]?
}

struct Month: Codable {
    let month: String?
    let days: [Day]?
}

struct Day: Codable {
    let day: String?
    let dayOfTheWeek: String?
    let schedules: [Schedule]?
}

struct Schedule: Codable {
    //let requestId: String
    let urgency: String?
    let scheduleType: String?
    let allDayType: String?
    let startTime: String?
    let endTime: String?
    let title: String?
    var content: String?
    let clinicName: String?
    let facilityName: String?
    let facilityLatitude: String?
    let facilityLongitude: String?
    let facilityPostalCode: String?
    let facilityAddress: String?
    //let explanation: String?
    let updater: String?
    let updateDayTime: String?
    
    
    //let none: String?
    
    private enum Key: String, CodingKey {
        case urgency = "kinkyudo_kbn"
        case scheduleType = "yotei_kbn"
        case allDayType = "shujitsu_kbn"
        case startTime = "kaishi_dt"
        case endTime = "shuryo_dt"
        case title
        case content = "setsumei"
        case clinicName = "clinic_nm"
        case facilityName = "shisetsu_nm"
        case facilityLatitude = "shisetsu_ido"
        case facilityLongitude = "shisetsu_keido"
        case facilityPostalCode = "shisetsu_yubin_bango"
        case facilityAddress = "shisetsu_jusho"
        case updater = "koshin_nm"
        case updateDayTime = "koshin_dt"
        
        
        //case none = "none"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.urgency = try container.decode(String?.self, forKey: .urgency)
        self.scheduleType = try container.decode(String?.self, forKey: .scheduleType)
        self.allDayType = try container.decode(String?.self, forKey: .allDayType)
        self.startTime = try container.decode(String?.self, forKey: .startTime)
        self.endTime = try container.decode(String?.self, forKey: .endTime)
        self.title = try container.decode(String?.self, forKey: .title)
        self.content = try container.decode(String?.self, forKey: .content)
        self.clinicName = try container.decode(String?.self, forKey: .clinicName)
        self.facilityName = try container.decode(String?.self, forKey: .facilityName)
        self.facilityLatitude = try container.decode(String?.self, forKey: .facilityLatitude)
        self.facilityLongitude = try container.decode(String?.self, forKey: .facilityLongitude)
        self.facilityPostalCode = try container.decode(String?.self, forKey: .facilityPostalCode)
        self.facilityAddress = try container.decode(String?.self, forKey: .facilityAddress)
        self.content = try container.decode(String?.self, forKey: .content)
        self.updater = try container.decode(String?.self, forKey: .updater)
        self.updateDayTime = try container.decode(String?.self, forKey: .updateDayTime)
        
        
        //self.none = try container.decode(String.self, forKey: .none)
    }
}
