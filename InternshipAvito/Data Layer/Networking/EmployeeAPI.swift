//
//  EmployeeAPI.swift
//  InternshipAvito
//
//  Created by Kairat Yelubay on 20.10.2022.
//

import Foundation

typealias EmployeeListAPIResponse = (Result<[Employee]?, CustomError>) -> Void

protocol EmployeeAPILogic {
    func fetchEmployees(completion: @escaping (EmployeeListAPIResponse))
}

class EmployeeAPI: EmployeeAPILogic {
    private struct Constants {
        static let employeeListURL = "https://run.mocky.io/v3/1d1cb4ec-73db-4762-8c4b-0b8aa3cecd4c"
    }
    
    func fetchEmployees(completion: @escaping (EmployeeListAPIResponse)) {
        guard let url = URL(string: Constants.employeeListURL) else {
            completion(.failure(CustomError.invalidURL))
            return
        }
        
        let urlSession = URLSession(configuration: .default)
        
        let task = urlSession.dataTask(with: url) { data, response, error in
            if let error = error {
                print("error occured \(error.localizedDescription)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                      completion(.failure(CustomError.invalidResponse))
                      return
            }
        
            guard let data = data else {
                completion(.failure(CustomError.invalidData))
                return
            }
            
            do {
                let result = try JSONDecoder().decode(EmployeeRootResult.self, from: data)
                let employee = result.company?.employees
                completion(.success(employee))
            }
            catch {
                print("error during parsing \(error)")
            }
        }
        
        task.resume()
    }
}
