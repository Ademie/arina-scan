//
//  String+Extension.swift
//  arina-scan
//
//  Created by Ademie  on 05/10/2023.
//

import Foundation

extension String: Error, LocalizedError{
    public var errorDescription: String? {self}
}
