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
    let label = UILabel()
    label.numberOfLines = 0
    label.font = .systemFont(ofSize: 20, weight: .bold)
    label.textColor = .black
    return label
  }()

  private let authorTitleLabel: UILabel = {
    let label = UILabel()
    label.text = "Author"
    label.font = .systemFont(ofSize: 16, weight: .bold)
    label.textColor = .black
    return label
  }()

  private let authorLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 18)
    label.textColor = .darkGray
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
    let label = UILabel()
    label.text = "Released"
    label.font = .systemFont(ofSize: 14, weight: .bold)
    label.textColor = .black
    return label
  }()

  private let releasedLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.textColor = .gray
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
    let label = UILabel()
    label.text = "Pages"
    label.font = .systemFont(ofSize: 14, weight: .bold)
    label.textColor = .black
    return label
  }()

  private let pageLabel: UILabel = {
    let label = UILabel()
    label.font = .systemFont(ofSize: 14)
    label.textColor = .gray
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

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension BookInfoView {
  func setupConfigures() {
    backgroundColor = .systemBackground
  }

  func setupViews() {
    addSubview(bookInfoStackView)

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

    setupConstraints()
  }

  func setupConstraints() {
    bookImageView.snp.makeConstraints { make in
      make.width.equalTo(100)
      make.height.equalTo(150)
    }

    bookInfoStackView.snp.makeConstraints { make in
      make.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(20)
      make.top.equalToSuperview()
    }
  }

  func updateBookInfo(to bookInfo: Book?) {
    guard let bookInfo else { return }
    bookTitleLabel.text = bookInfo.title
    authorLabel.text = bookInfo.author
    releasedLabel.text = bookInfo.releaseDate
    pageLabel.text = String(bookInfo.pages)
  }

  func updateImage(name: String) {
    bookImageView.image = UIImage(named: name)
  }
}
