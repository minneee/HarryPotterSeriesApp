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

  private let scrollView: UIScrollView = {
    let scrollView = UIScrollView()
    scrollView.showsVerticalScrollIndicator = false
    return scrollView
  }()

  private let contentView: UIView = {
    let view = UIView()
    return view
  }()

  private let bookInfoView: BookInfoView = {
    let view = BookInfoView()
    return view
  }()

  private let chapterListView: ChapterListView = {
    let view = ChapterListView()
    return view
  }()

  private let bookContentStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .fill
    stackView.spacing = 24
    return stackView
  }()

  var onSeriesButtonTapped: ((Int) -> Void)?
  var onToggleSummaryButtonTapped: (() -> Void)?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()

    headerView.onSeriesButtonTapped = { [weak self] index in
      self?.onSeriesButtonTapped?(index)
    }

    bookInfoView.onToggleSummaryButtonTapped = { [weak self] in
      self?.onToggleSummaryButtonTapped?()
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
    addSubview(scrollView)

    scrollView.addSubview(contentView)
    contentView.addSubview(bookContentStackView)

    bookContentStackView.addArrangedSubview(bookInfoView)
    bookContentStackView.addArrangedSubview(chapterListView)

    setupConstraints()
  }

  func setupConstraints() {
    headerView.snp.makeConstraints { make in
      make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
      make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
    }

    scrollView.snp.makeConstraints { make in
      make.top.equalTo(headerView.snp.bottom).offset(10)
      make.bottom.equalTo(self.safeAreaInsets.bottom)
      make.leading.trailing.equalToSuperview()
    }

    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview()
      make.width.equalToSuperview()
    }

    bookContentStackView.snp.makeConstraints { make in
      make.top.equalToSuperview().offset(20)
      make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
      make.bottom.equalToSuperview().inset(10)
    }
  }

  func configure(book: Book?, imageName: String, isExpanded: Bool, selectedIndex: Int?) {
    updateTitle(newTitle: book?.title ?? "제목 없음")
    updateBookInfo(bookInfo: book, isInitiallyExpanded: isExpanded)
    updateBookImage(name: imageName)
    updateChapterList(chapters: book?.chapters ?? [])
    updateButtonSelection(selectedIndex: selectedIndex)
  }

  private func updateTitle(newTitle: String) {
    headerView.updateTitle(newTitle: newTitle)
  }

  private func updateBookInfo(bookInfo: Book?, isInitiallyExpanded: Bool) {
    bookInfoView.updateBookInfo(bookInfo: bookInfo, isInitiallyExpanded: isInitiallyExpanded)
  }

  private func updateBookImage(name: String) {
    bookInfoView.updateImage(name: name)
  }

  private func updateChapterList(chapters: [Chapter]) {
    chapterListView.updateChapterList(chapters: chapters)
  }

  private func updateButtonSelection(selectedIndex: Int?) {
    headerView.updateButtonSelection(selectedIndex: selectedIndex)
  }
}
