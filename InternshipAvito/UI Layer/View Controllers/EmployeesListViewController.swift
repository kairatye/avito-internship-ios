//
//  EmployeesListViewController.swift
//  InternshipAvito
//
//  Created by Kairat Yelubay on 19.10.2022.
//

import UIKit

class EmployeesListViewController: UIViewController {
    
    private var employeeViewModel = EmployeeViewModel()
    
    private var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        employeeViewModel.fetchEmployees()
        setupBinders()
        title = "Employees List"
    }
    
    private func setupTableView() {
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: EmployeeTableViewCell.cellIdentifier)
        tableView.backgroundColor = .white
        tableView.rowHeight = 100.0
        tableView.allowsSelection = false
        tableView.separatorStyle = .none
        tableView.dataSource = self
        view.addSubview(tableView)

        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func setupBinders() {
        employeeViewModel.employees.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
        
        employeeViewModel.error.bind { error in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
}

extension EmployeesListViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return employeeViewModel.employees.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: EmployeeTableViewCell.cellIdentifier, for: indexPath) as? EmployeeTableViewCell else {
            return UITableViewCell()
        }
        cell.populate(employeeViewModel, indexPath: indexPath)
        return cell
    }
}
