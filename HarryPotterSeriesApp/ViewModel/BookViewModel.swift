//
//  BookViewModel.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/8/25.
//
import Foundation
import Combine

protocol BookViewModelProtocol {
  var bookInfoPublisher: Published<[Book]?>.Publisher { get }
  var currentBookPublisher: Published<Book?>.Publisher { get }
  var errorMessagePublisher: Published<String?>.Publisher { get }

  var title: String { get }
  var author: String { get }
  var formattedReleaseDate: String { get }
  var pages: String { get }
  var coverImageName: String { get }

  func fetchData()
  func selectBook(at index: Int)
}

class BookViewModel: BookViewModelProtocol {
  @Published var bookInfo: [Book]?
  @Published var currentBook: Book?
  @Published var errorMessage: String?
  var bookInfoPublisher: Published<[Book]?>.Publisher { $bookInfo }
  var currentBookPublisher: Published<Book?>.Publisher { $currentBook }
  var errorMessagePublisher: Published<String?>.Publisher { $errorMessage }

  var title: String { currentBook?.title ?? "제목 없음" }
  var author: String { currentBook?.author ?? "" }
  var formattedReleaseDate: String {
    currentBook?.releaseDate.toFormattedDateString() ?? "날짜 정보 없음"
  }
  var pages: String {
    if let pages = currentBook?.pages {
      return "\(pages)"
    }
    return ""
  }

  var coverImageName: String {
    guard let currentBook = currentBook, let books = bookInfo else {
      return "harrypotter1"
    }

    if let index = books.firstIndex(where: { $0.id == currentBook.id }) {
      return "harrypotter\(index + 1)"
    }

    return "harrypotter1"
  }


  private let repository: BookRepositoryProtocol

  init(bookInfo: [Book]? = nil, repository: BookRepositoryProtocol) {
    self.bookInfo = bookInfo
    self.repository = repository
  }

  func fetchData() {
    do {
      let books = try repository.fetchBooks()
      self.bookInfo = books
      self.currentBook = books.first
    } catch {
      print("failed to fetch data: \(error)")
      self.errorMessage = error.localizedDescription
    }
  }

  func selectBook(at index: Int) {
    guard let books = bookInfo, books.indices.contains(index) else { return }
    self.currentBook = books[index]
  }
}

