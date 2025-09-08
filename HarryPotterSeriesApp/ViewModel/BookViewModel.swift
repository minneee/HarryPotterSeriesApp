//
//  BookViewModel.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/8/25.
//
import Foundation
import Combine

protocol BookViewModelProtocol {
  var bookTitlePublisher: Published<String?>.Publisher { get }
  func fetchData()
}

class BookViewModel: BookViewModelProtocol {
  @Published var bookTitle: String?
  var bookTitlePublisher: Published<String?>.Publisher { $bookTitle }

  private let repository: BookRepositoryProtocol

  init(bookTitle: String? = nil, repository: BookRepositoryProtocol) {
    self.bookTitle = bookTitle
    self.repository = repository
  }

  func fetchData() {
    do {
      let books = try repository.fetchBooks()
      self.bookTitle = books.first?.title
    } catch {
      self.bookTitle = "데이터 로드 실패"
      print("failed to fetch data: \(error)")
    }
  }


}

