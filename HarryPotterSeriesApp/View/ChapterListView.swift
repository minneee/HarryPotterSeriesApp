//
//  ChapterListView.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/10/25.
//


import UIKit
import SnapKit

final class ChapterListView: UIView {
  private let titleLabel: UILabel = {
    let label = TitleLabel(fontSize: 18)
    label.text = "Chapters"
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
      let chapterLabel = BodyLabel(fontSize: 14, textColor: .darkGray)
      chapterLabel.text = chapter.title
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
      make.leading.trailing.equalToSuperview()
      make.top.bottom.equalToSuperview()
    }
  }

  func updateChapterList(chapters: [Chapter]) {
    setupChapterTitleLabel(chapterTitles: chapters)
  }
}
