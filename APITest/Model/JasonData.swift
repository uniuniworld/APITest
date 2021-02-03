//
//  JasonData.swift
//  APITest
//
//  Created by t_kirifu on 2021/02/01.
//

import Foundation

struct InitData: Codable {
    
    let result: Bool
    let requestData: [RequestData]
    let scheduleData: [ScheduleData]
    let reportData: [ReportData]
    
}

//struct RequestData: Codable {
//    //var requestId: String
//    var urgency: String
//    var facilityName: String
//    var clinicName: String
//    var requestContent: String
//    var acceptanceDeadline: String
//    var startDayAndTime: String
//    var requestStatus: String
//    var postalCode: String
//    var address: String
//    
//    enum Key: String, CodingKey {
//        case urgency = "kinkyudo_kbn"
//        case facilityName = "shisetsu_nm"
//        case clinicName = "clinic_nm"
//        case requestContent = "irai_naiyo"
//        case acceptanceDeadline = "irai_oto_jikan"
//        case startDayAndTime = "kaishi_dt"
//        case requestStatus = "irai_jokyo_kbn"
//        case postalCode = "yubin_bango"
//        case address = "jusho"
//    }
//    
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: Key.self)
//        self.urgency = try container.decode(String.self, forKey: .urgency)
//        self.facilityName = try container.decode(String.self, forKey: .facilityName)
//        self.clinicName = try container.decode(String.self, forKey: .clinicName)
//        self.requestContent = try container.decode(String.self, forKey: .requestContent)
//        self.acceptanceDeadline = try container.decode(String.self, forKey: .acceptanceDeadline)
//        self.startDayAndTime = try container.decode(String.self, forKey: .startDayAndTime)
//        self.requestStatus = try container.decode(String.self, forKey: .requestStatus)
//        self.postalCode = try container.decode(String.self, forKey: .postalCode)
//        self.address = try container.decode(String.self, forKey: .address)
//    }
//}

//struct ScheduleData: Codable {
//    let years: [Year]
//    enum Key: String, CodingKey {
//        case years
//    }
//    
//    struct Year: Codable {
//        let year: String
//        let months: [Month]
//        
//        enum Key: String, CodingKey {
//            case year
//            case months
//        }
//    }
//    
//    struct Month: Codable {
//        let month: String
//        let days: [Day]
//        
//        enum Key: String, CodingKey {
//            case month
//            case days
//        }
//    }
//    
//    struct Day: Codable {
//        let day: String
//        let dayOfTheWeek: String
//        let schedules: [Schedule]
//        
//        enum Key: String, CodingKey {
//            case day
//            case dayOfTheWeek
//            case schedules
//        }
//    }
//    
//    struct Schedule: Codable {
//        
//        //let requestId: String
//        let scheduleType: String
//        let allDayType: String
//        let startTime: String
//        let endTime: String
//        let title: String
//        let facilityName: String
//        //let location: String
//        let postalCode: String
//        let address: String
//        let latitude: String
//        let longitude: String
//        //let explanation: String
//        let content: String
//        let updater: String
//        let updateDayTime: String
//        
//        enum Key: String, CodingKey {
//            case scheduleType = "yoyaku_kbn"
//            case allDayType = "shujitsu_kbn"
//            case startTime = "kaishi_dt"
//            case endTime = "shuryo_dt"
//            case title = "title"
//            case facilityName = "shisetsu_nm"
//            //case location = ""
//            case postalCode = "yubin_bango"
//            case address = "jusho"
//            case latitude = "ido"
//            case longitude = "keido"
//            //case explanation = ""
//            case content = "setsumei"
//            case updater = "koushin"
//            case updateDayTime = "koshin_dt"
//        }
//        
//        init(from decoder: Decoder) throws {
//            let container = try decoder.container(keyedBy: Key.self)
//            self.scheduleType = try container.decode(String.self, forKey: .scheduleType)
//            self.allDayType = try container.decode(String.self, forKey: .allDayType)
//            self.startTime = try container.decode(String.self, forKey: .startTime)
//            self.endTime = try container.decode(String.self, forKey: .endTime)
//            self.title = try container.decode(String.self, forKey: .title)
//            self.facilityName = try container.decode(String.self, forKey: .facilityName)
//            self.postalCode = try container.decode(String.self, forKey: .postalCode)
//            self.address = try container.decode(String.self, forKey: .address)
//            self.latitude = try container.decode(String.self, forKey: .latitude)
//            self.longitude = try container.decode(String.self, forKey: .longitude)
//            self.content = try container.decode(String.self, forKey: .content)
//            self.updater = try container.decode(String.self, forKey: .updater)
//            self.updateDayTime = try container.decode(String.self, forKey: .updateDayTime)
//        }
//    }
//}

struct ReportData: Codable {
    //var requestId: String
    var urgency: String
    var facilityName: String
    var clinicName: String
    var requestContent: String
    var acceptanceDeadline: String
    var startDayAndTime: String
    var requestStatus: String
    var postalCode: String
    var address: String
    var medicalRecord: String
    var prescription: String
    
    enum Key: String, CodingKey {
        case urgency = "kinkyudo_kbn"
        case facilityName = "shisetsu_nm"
        case clinicName = "clinic_nm"
        case requestContent = "irai_naiyo"
        case acceptanceDeadline = "irai_oto_jikan"
        case startDayAndTime = "kaishi_dt"
        case requestStatus = "irai_jokyo_kbn"
        case postalCode = "yubin_bango"
        case address = "jusho"
        case medicalRecord = "karute"
        case prescription = "syoho"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.urgency = try container.decode(String.self, forKey: .urgency)
        self.facilityName = try container.decode(String.self, forKey: .facilityName)
        self.clinicName = try container.decode(String.self, forKey: .clinicName)
        self.requestContent = try container.decode(String.self, forKey: .requestContent)
        self.acceptanceDeadline = try container.decode(String.self, forKey: .acceptanceDeadline)
        self.startDayAndTime = try container.decode(String.self, forKey: .startDayAndTime)
        self.requestStatus = try container.decode(String.self, forKey: .requestStatus)
        self.postalCode = try container.decode(String.self, forKey: .postalCode)
        self.address = try container.decode(String.self, forKey: .address)
        self.medicalRecord = try container.decode(String.self, forKey: .medicalRecord)
        self.prescription = try container.decode(String.self, forKey: .prescription)
    }
}



