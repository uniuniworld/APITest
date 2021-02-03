//
//  RequestData.swift
//  APITest
//
//  Created by t_kirifu on 2021/02/02.
//

import Foundation

struct RequestData: Codable {
    let data: [Request]
}

struct Request: Codable {
    
    let requestStatus: String
    let urgency: String
    let facilityName: String
    let clinicName: String
    let requestContent: String
    let acceptanceDeadline: Int
    let startDayAndTime: String
    let postalCode: String
    let address: String
    
    private enum Key: String, CodingKey {
        case requestStatus = "irai_jokyo_kbn"
        case urgency = "kinkyudo_kbn"
        case facilityName = "shisetsu_nm"
        case clinicName = "clinic_nm"
        case requestContent = "irai_naiyo"
        case acceptanceDeadline = "irai_oto_jikan"
        case startDayAndTime = "kaishi_dt"
        case postalCode = "yubin_bango"
        case address = "jusho"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: Key.self)
        self.requestStatus = try container.decode(String.self, forKey: .requestStatus)
        self.urgency = try container.decode(String.self, forKey: .urgency)
        self.facilityName = try container.decode(String.self, forKey: .facilityName)
        self.clinicName = try container.decode(String.self, forKey: .clinicName)
        self.requestContent = try container.decode(String.self, forKey: .requestContent)
        self.acceptanceDeadline = try container.decode(Int.self, forKey: .acceptanceDeadline)
        self.startDayAndTime = try container.decode(String.self, forKey: .startDayAndTime)
        self.postalCode = try container.decode(String.self, forKey: .postalCode)
        self.address = try container.decode(String.self, forKey: .address)
    }
}
