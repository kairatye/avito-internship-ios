//
//  EmployeeTableViewCell.swift
//  InternshipAvito
//
//  Created by Kairat Yelubay on 20.10.2022.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    
    static let cellIdentifier = "EmployeeTableViewCell"
    
    private struct Constants {
        static let leftInset: CGFloat = 10.0
        static let topInset: CGFloat = 10.0
        static let rightInset: CGFloat = -10.0
        static let bottomInset: CGFloat = -10.0
        static let borderWidth: CGFloat = 0.5
        static let cornerRadius: CGFloat = 10.0
    }
    
    var nameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 16.0, weight: .medium)
        return label
    }()
    
    var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        return label
    }()
    
    var skillsLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.setContentHuggingPriority(.defaultLow - 1, for: .vertical)
        label.font = UIFont.systemFont(ofSize: 12.0, weight: .medium)
        return label
    }()
    
    private var wrapperView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.borderWidth = Constants.borderWidth
        view.layer.cornerRadius = Constants.cornerRadius
        return view
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.backgroundColor = .white
        setupWrapperView()
        setupNameLabel()
        setupPhoneNumberLabel()
        setupSkillsLabel()
    }
    
    private func setupWrapperView() {
        contentView.addSubview(wrapperView)
        
        NSLayoutConstraint.activate([
            wrapperView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,
                                                 constant: Constants.leftInset),
            wrapperView.topAnchor.constraint(equalTo: contentView.topAnchor,
                                             constant: 5.0),
            wrapperView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor,
                                                  constant: Constants.rightInset),
            wrapperView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor,
                                                constant: -5.0)
        ])
    }
    
    private func setupNameLabel() {
        wrapperView.addSubview(nameLabel)
        
        NSLayoutConstraint.activate([
            nameLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor,
                                               constant: Constants.leftInset),
            nameLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor,
                                                constant: Constants.rightInset),
            nameLabel.topAnchor.constraint(equalTo: wrapperView.topAnchor,
                                           constant: Constants.topInset)
        ])
    }
    
    private func setupPhoneNumberLabel() {
        wrapperView.addSubview(phoneNumberLabel)
        
        NSLayoutConstraint.activate([
            phoneNumberLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor,
                                                      constant: Constants.leftInset),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor,
                                                       constant: Constants.rightInset),
            phoneNumberLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor,
                                                  constant: Constants.topInset)
        ])
    }
    
    private func setupSkillsLabel() {
        wrapperView.addSubview(skillsLabel)
        
        NSLayoutConstraint.activate([
            skillsLabel.leadingAnchor.constraint(equalTo: wrapperView.leadingAnchor,
                                                 constant: Constants.leftInset),
            skillsLabel.trailingAnchor.constraint(equalTo: wrapperView.trailingAnchor,
                                                  constant: Constants.rightInset),
            skillsLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor,
                                             constant: Constants.topInset),
            skillsLabel.bottomAnchor.constraint(equalTo: wrapperView.bottomAnchor,
                                                constant: Constants.bottomInset)
        ])
    }
    
    func populate(_ viewModel: EmployeeViewModel, indexPath: IndexPath) {
        let name = viewModel.employees.value[indexPath.row].name ?? ""
        let phoneNumber = viewModel.employees.value[indexPath.row].phoneNumber ?? ""
        let skills = viewModel.employees.value[indexPath.row].skills?.joined(separator: ", ") ?? ""
        self.nameLabel.text = name
        self.phoneNumberLabel.text = "Phone number: \(phoneNumber)"
        self.skillsLabel.text = "Skills: \(skills)"
    }
}
