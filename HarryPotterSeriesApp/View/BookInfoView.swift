//
//  BookInfoView.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/9/25.
//

import UIKit

class BookInfoView: UIView {
  private let bookImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.image = UIImage(named: "harrypotter1")
    imageView.contentMode = .scaleAspectFit
    return imageView
  }()

  private let bookTitleLabel: UILabel = {
    let label = TitleLabel(fontSize: 20)
    label.numberOfLines = 0
    return label
  }()

  private let authorTitleLabel: UILabel = {
    let label = TitleLabel(fontSize: 16)
    label.text = "Author"
    return label
  }()

  private let authorLabel: UILabel = {
    let label = BodyLabel(fontSize: 18, textColor: .darkGray)
    return label
  }()

  private let authorStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 8
    stackView.alignment = .leading
    return stackView
  }()

  private let releasedTitleLabel: UILabel = {
    let label = TitleLabel(fontSize: 14)
    label.text = "Released"
    return label
  }()

  private let releasedLabel: UILabel = {
    let label = BodyLabel(fontSize: 14, textColor: .gray)
    return label
  }()

  private let releasedStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 8
    stackView.alignment = .leading
    return stackView
  }()

  private let pageTitleLabel: UILabel = {
    let label = TitleLabel(fontSize: 14)
    label.text = "Pages"
    return label
  }()

  private let pageLabel: UILabel = {
    let label = BodyLabel(fontSize: 14, textColor: .gray)
    return label
  }()

  private let pageStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 8
    stackView.alignment = .leading
    return stackView
  }()

  private let bookInfoLableStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 10
    stackView.alignment = .top
    return stackView
  }()

  private let bookInfoStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 10
    stackView.alignment = .center
    return stackView
  }()

  private let dedicationTitleLabel: UILabel = {
    let label = TitleLabel(fontSize: 18)
    label.text = "Dedication"
    return label
  }()

  private let dedicationLabel: UILabel = {
    let label = BodyLabel(fontSize: 14, textColor: .darkGray)
    label.numberOfLines = 0
    return label
  }()

  private let dedicationStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 8
    stackView.alignment = .leading
    return stackView
  }()

  private let summaryTitleLabel: UILabel = {
    let label = TitleLabel(fontSize: 18)
    label.text = "Summary"
    return label
  }()

  private let summaryLabel: UILabel = {
    let label = BodyLabel(fontSize: 14, textColor: .darkGray)
    label.numberOfLines = 0
    return label
  }()

  private let summaryToggleButton: UIButton = {
    let button = UIButton(type: .system)
    button.setTitle("더보기", for: .normal)
    button.titleLabel?.font = .systemFont(ofSize: 14, weight: .semibold)
    button.contentHorizontalAlignment = .trailing
    return button
  }()

  private let summaryStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 8
    return stackView
  }()

  private let bookStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.spacing = 24
    stackView.alignment = .fill
    return stackView
  }()

  var onToggleSummaryButtonTapped: (() -> Void)?

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()

    summaryToggleButton.addTarget(self, action: #selector(toggleSummary), for: .touchUpInside)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  @objc private func toggleSummary() {
    onToggleSummaryButtonTapped?()
  }
}

extension BookInfoView {
  func setupConfigures() {
    backgroundColor = .systemBackground
  }

  func setupViews() {
    addSubview(bookStackView)

    authorStackView.addArrangedSubview(authorTitleLabel)
    authorStackView.addArrangedSubview(authorLabel)

    releasedStackView.addArrangedSubview(releasedTitleLabel)
    releasedStackView.addArrangedSubview(releasedLabel)

    pageStackView.addArrangedSubview(pageTitleLabel)
    pageStackView.addArrangedSubview(pageLabel)

    bookInfoLableStackView.addArrangedSubview(bookTitleLabel)
    bookInfoLableStackView.addArrangedSubview(authorStackView)
    bookInfoLableStackView.addArrangedSubview(releasedStackView)
    bookInfoLableStackView.addArrangedSubview(pageStackView)

    bookInfoStackView.addArrangedSubview(bookImageView)
    bookInfoStackView.addArrangedSubview(bookInfoLableStackView)

    dedicationStackView.addArrangedSubview(dedicationTitleLabel)
    dedicationStackView.addArrangedSubview(dedicationLabel)

    summaryStackView.addArrangedSubview(summaryTitleLabel)
    summaryStackView.addArrangedSubview(summaryLabel)
    summaryStackView.addArrangedSubview(summaryToggleButton)

    bookStackView.addArrangedSubview(bookInfoStackView)
    bookStackView.addArrangedSubview(dedicationStackView)
    bookStackView.addArrangedSubview(summaryStackView)

    setupConstraints()
  }

  func setupConstraints() {
    bookImageView.snp.makeConstraints { make in
      make.width.equalTo(100)
      make.height.equalTo(150)
    }

    bookStackView.snp.makeConstraints { make in
      make.leading.trailing.equalToSuperview()
      make.top.bottom.equalToSuperview()
    }
  }

  func updateBookInfo(bookInfo: Book?, isInitiallyExpanded: Bool) {
    guard let bookInfo else { return }
    bookTitleLabel.text = bookInfo.title
    authorLabel.text = bookInfo.author
    releasedLabel.text = bookInfo.releaseDate
    pageLabel.text = String(bookInfo.pages)
    dedicationLabel.text = bookInfo.dedication
    summaryLabel.text = bookInfo.summary
    updateSummaryExpanded(summary: bookInfo.summary, isExpanded: isInitiallyExpanded)

  }

  func updateImage(name: String) {
    bookImageView.image = UIImage(named: name)
  }

  func updateSummaryExpanded(summary: String, isExpanded: Bool) {
    guard summary.count >= 450 else {
      summaryLabel.text = summary
      summaryToggleButton.isHidden = true
      return
    }

    summaryToggleButton.isHidden = false

    if isExpanded {
      summaryLabel.text = summary
      summaryToggleButton.setTitle("접기", for: .normal)
    } else {
      summaryLabel.text = String(summary.prefix(450)) + "..."
      summaryToggleButton.setTitle("더보기", for: .normal)
    }
  }
}
