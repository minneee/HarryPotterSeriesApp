//
//  BookViewController.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/8/25.
//

import UIKit
import Combine

class BookViewController: UIViewController {
  private let rootView: MainView
  private let viewModel: BookViewModelProtocol

  private var cancellables = Set<AnyCancellable>()

  init(rootView: MainView, viewModel: BookViewModelProtocol) {
    self.rootView = rootView
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)

    self.rootView.onSeriesButtonTapped = { [weak self] index in
      self?.viewModel.selectBook(at: index)
    }

    self.rootView.onToggleSummaryButtonTapped = { [weak self] in
      self?.viewModel.toggleSummaryExpansion()
    }
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  override func loadView() {
    view = rootView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    viewModel.fetchData()
    bindViewModel()
  }

  func bindViewModel() {
    viewModel.bookInfoPublisher
      .receive(on: DispatchQueue.main)
      .sink { [weak self] books in
        self?.rootView.setupHeader(bookCount: books?.count ?? 0)
      }
      .store(in: &cancellables)

    viewModel.currentBookPublisher
      .receive(on: DispatchQueue.main)
      .sink { [weak self] currentBook in
        guard let self = self, let book = currentBook else {
          self?.rootView.configure(book: nil, imageName: "harrypotter1", isExpanded: false, selectedIndex: nil)
          return
        }

        var displayBook = book
        displayBook.releaseDate = self.viewModel.formattedReleaseDate
        let imageName = self.viewModel.coverImageName
        let isExpanded = self.viewModel.isCurrentSummaryExpanded
        self.rootView.configure(book: displayBook, imageName: imageName, isExpanded: isExpanded, selectedIndex: self.viewModel.currentBookIndex)
      }
      .store(in: &cancellables)

    viewModel.errorMessagePublisher
      .receive(on: DispatchQueue.main)
      .sink { [weak self] error in
        guard let error else { return }
        self?.showAlert(message: error)
      }
      .store(in: &cancellables)
  }
  private func showAlert(message: String) {
    let alert = UIAlertController(title: "오류", message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "확인", style: .default))
    present(alert, animated: true)
  }
}

