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

  init(rootView: MainView, viewModel: BookViewModel) {
    self.rootView = rootView
    self.viewModel = viewModel
    super.init(nibName: nil, bundle: nil)
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
    viewModel.bookTitlePublisher
      .receive(on: DispatchQueue.main)
      .sink { [weak self] newTitle in
        self?.rootView.updateTitle(to: newTitle ?? "제목없음")
      }
      .store(in: &cancellables)
  }
}

