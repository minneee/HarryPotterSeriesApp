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

  var formattedReleaseDate: String { get }
  var coverImageName: String { get }
  var isCurrentSummaryExpanded: Bool { get }

  func fetchData()
  func selectBook(at index: Int)
  func toggleSummaryExpansion()
}

class BookViewModel: BookViewModelProtocol {
  @Published var bookInfo: [Book]?
  @Published var currentBook: Book?
  @Published var errorMessage: String?
  @Published private var summaryExpansionStates: [String: Bool]
  var bookInfoPublisher: Published<[Book]?>.Publisher { $bookInfo }
  var currentBookPublisher: Published<Book?>.Publisher { $currentBook }
  var errorMessagePublisher: Published<String?>.Publisher { $errorMessage }

  var formattedReleaseDate: String {
    currentBook?.releaseDate.toFormattedDateString() ?? "날짜 정보 없음"
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

  var isCurrentSummaryExpanded: Bool {
    guard let currentBookTitle = currentBook?.title else { return false }
    return summaryExpansionStates[currentBookTitle] ?? false
  }


  private let bookRepository: BookRepositoryProtocol
  private let expansionStateRepository: ExpansionStateRepositoryProtocol

  init(bookInfo: [Book]? = nil, bookRepository: BookRepositoryProtocol, expansionStateRepository: ExpansionStateRepositoryProtocol) {
    self.bookInfo = bookInfo
    self.bookRepository = bookRepository
    self.expansionStateRepository = expansionStateRepository
    self.summaryExpansionStates = expansionStateRepository.load()
  }

  func fetchData() {
    do {
      let books = try bookRepository.fetchBooks()
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

  func toggleSummaryExpansion() {
    guard let currentBookTitle = currentBook?.title else { return }
    let currentState = summaryExpansionStates[currentBookTitle] ?? false
    summaryExpansionStates[currentBookTitle] = !currentState
    expansionStateRepository.save(state: summaryExpansionStates)

    self.currentBook = self.currentBook
  }
}

