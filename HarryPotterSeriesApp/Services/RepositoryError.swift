//
//  RepositoryError.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/11/25.
//
import Foundation

enum RepositoryError: Error {
    case fileNotFound
    case parsingFailed(Error)
  }
