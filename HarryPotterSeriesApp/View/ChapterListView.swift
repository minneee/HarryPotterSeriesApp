//
//  ChapterListView.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/10/25.
//


import UIKit
import SnapKit

class ChapterListView: UIView {
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "Chapters"
    label.font = .systemFont(ofSize: 18, weight: .bold)
    label.textColor = .black
    return label
  }()

  private let chaptersStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 8
    stackView.alignment = .fill
    return stackView
  }()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupChapterTitleLabel(chapterTitles: [Chapter]) {
    chaptersStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

    chaptersStackView.addArrangedSubview(titleLabel)

    for chapter in chapterTitles {
      let chapterLabel = UILabel()
      chapterLabel.text = chapter.title
      chapterLabel.font = .systemFont(ofSize: 14)
      chapterLabel.textColor = .darkGray
      chapterLabel.numberOfLines = 0
      chaptersStackView.addArrangedSubview(chapterLabel)
    }
  }
}

extension ChapterListView {
  func setupConfigures() {
    backgroundColor = .systemBackground
  }

  private func setupViews() {
    addSubview(titleLabel)
    addSubview(chaptersStackView)

    setupConstraints()
  }

  func setupConstraints() {
    chaptersStackView.snp.makeConstraints { make in
      make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
      make.top.bottom.equalToSuperview()
    }
  }

  func updateChapterList(chapters: [Chapter]) {
    setupChapterTitleLabel(chapterTitles: chapters)
  }
}
