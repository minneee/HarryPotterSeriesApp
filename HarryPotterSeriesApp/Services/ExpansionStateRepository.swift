//
//  ExpansionStateRepository.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/10/25.
//

import Foundation

protocol ExpansionStateRepositoryProtocol {
  func save(state: [String: Bool])
  func load() -> [String: Bool]
}

final class ExpansionStateRepository: ExpansionStateRepositoryProtocol {
  private let userDefaultsKey = "summaryExpansionState"

  func save(state: [String: Bool]) {
    UserDefaults.standard.set(state, forKey: userDefaultsKey)
  }

  func load() -> [String: Bool] {
    return UserDefaults.standard.dictionary(forKey: userDefaultsKey) as? [String: Bool] ?? [:]
  }
}
