//
//  EmployeeViewModel.swift
//  InternshipAvito
//
//  Created by Kairat Yelubay on 21.10.2022.
//

import Foundation

class EmployeeViewModel {
    
    private(set) var employees: Observable<[Employee]> = Observable([])
    private(set) var error: Observable<CustomError?> = Observable(nil)
    private let apiService: EmployeeAPILogic
    
    init(apiService: EmployeeAPILogic = EmployeeAPI()) {
        self.apiService = apiService
    }
    
    func fetchEmployees() {
        apiService.fetchEmployees { [weak self] result in
            switch result {
            case .success(let employees):
                self?.employees.value = employees?.sorted { $0.name ?? "" < $1.name ?? "" } ?? []
            case .failure(let error):
                self?.error.value = error
            }
        }
    }
}
