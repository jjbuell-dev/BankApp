//
//
// BankApp
// 
// DecimalUtilities.swift
//
// Created by Royal Blue Software
// 


import Foundation

extension Decimal {
    var doubleValue: Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
