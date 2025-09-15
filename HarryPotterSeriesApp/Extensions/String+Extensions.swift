//
//  String+Extensions.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/9/25.
//
import Foundation

extension String {
  func toFormattedDateString() -> String? {
    let inputFormatter = DateFormatter()
    inputFormatter.dateFormat = "yyyy-MM-dd"

    guard let date = inputFormatter.date(from: self) else { return nil }

    let outputFormatter = DateFormatter()
    outputFormatter.dateFormat = "MMMM d, yyyy"
    outputFormatter.locale = Locale(identifier: "en_US")

    return outputFormatter.string(from: date)
  }
}
