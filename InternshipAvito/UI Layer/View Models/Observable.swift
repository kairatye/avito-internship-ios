//
//  Dynamic.swift
//  InternshipAvito
//
//  Created by Kairat Yelubay on 24.10.2022.
//

import Foundation

class Observable<T> {

    private var listener: ((T) -> Void)?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }

    init(_ value: T) {
        self.value = value
    }

    func bind(_ closure: @escaping (T) -> Void) {
        closure(value)
        listener = closure
    }
}
