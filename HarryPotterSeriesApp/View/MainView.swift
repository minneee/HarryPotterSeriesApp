//
//  MainView.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/8/25.
//
import UIKit
import SnapKit

class MainView: UIView {
  private let headerView: HeaderView = {
    let view = HeaderView()
    return view
  }()

  private let bookInfoView: BookInfoView = {
    let view = BookInfoView()
    return view
  }()

  var onSeriesButtonTapped: ((Int) -> Void)?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()

    headerView.onSeriesButtonTapped = { [weak self] index in
      self?.onSeriesButtonTapped?(index)
    }
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupHeader(bookCount: Int) {
    headerView.setupSeriesButton(count: bookCount)
  }
}

extension MainView {
  func setupConfigures() {
    backgroundColor = .systemBackground
  }

  func setupViews() {
    addSubview(headerView)
    addSubview(bookInfoView)

    setupConstraints()
  }

  func setupConstraints() {
    headerView.snp.makeConstraints { make in
      make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
      make.leading.trailing.equalToSuperview()
    }

    bookInfoView.snp.makeConstraints { make in
      make.top.equalTo(headerView.snp.bottom).offset(30)
      make.leading.trailing.equalToSuperview()
    }
  }

  func updateTitle(to newTitle: String) {
      headerView.updateTitle(to: newTitle)
  }

  func updateBookInfo(to bookInfo: Book?) {
    bookInfoView.updateBookInfo(to: bookInfo)
  }

  func updateBookImage(name: String) {
    bookInfoView.updateImage(name: name)
  }
}
