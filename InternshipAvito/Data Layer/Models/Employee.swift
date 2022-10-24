//
//  Employee.swift
//  InternshipAvito
//
//  Created by Kairat Yelubay on 19.10.2022.
//

import Foundation

struct EmployeeRootResult: Codable {
    let company: Company?
}

struct Company: Codable {
    let name: String?
    let employees: [Employee]?
}

struct Employee: Codable {
    let name: String?, phoneNumber: String?
    let skills: [String]?
    
    enum CodingKeys: String, CodingKey {
        case name
        case phoneNumber = "phone_number"
        case skills
    }
}
