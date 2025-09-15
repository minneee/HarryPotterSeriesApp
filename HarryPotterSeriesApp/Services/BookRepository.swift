//
//  BookRepository.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/8/25.
//

import Foundation
protocol BookRepositoryProtocol {
  func fetchBooks() throws -> [Book]
}

final class BookRepository: BookRepositoryProtocol {
  func fetchBooks() throws -> [Book] {
    //프로젝트 번들에서 파일 경로 찾기
    guard let fileURL = Bundle.main.url(forResource: "data", withExtension: "json") else {
      throw RepositoryError.fileNotFound
    }

    //파일 경로를 통해 데이터 읽기
    do {
      //JSONDecoder로 데이터 파싱
      let data = try Data(contentsOf: fileURL)
      let decoder = JSONDecoder()
      let response = try decoder.decode(APIResponse.self, from: data)

      //Book 배열만 추출하여 반환
      let books = response.data.map { $0.attributes }
      return books
    } catch {
      throw RepositoryError.parsingFailed(error)
    }
  }
}

