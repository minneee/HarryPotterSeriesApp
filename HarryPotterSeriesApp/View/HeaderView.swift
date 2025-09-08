//
//  HeaderView.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/8/25.
//

import UIKit
import SnapKit

class HeaderView: UIView {

  //MARK: - UI Property
  private var bookTitleLable: UILabel = {
    let label = UILabel()
    label.text = "책 제목"
    label.textAlignment = .center
    label.font = .systemFont(ofSize: 24, weight: .bold)
    label.numberOfLines = 0
    return label
  }()

  private let seriesButtonStackView: UIStackView = {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 8
    return stackView
  }()

  private var seriesNumberButton: UIButton = {
    let button = UIButton()
    button.setTitle("1", for: .normal)
    button.backgroundColor = .systemBlue
    button.titleLabel?.font = .systemFont(ofSize: 16)
    button.layer.cornerRadius = 15
    return button
  }()

  //MARK: - initialize
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension HeaderView {
  func setupConfigures() {
    backgroundColor = .systemBackground
  }

  func setupViews() {
    addSubview(bookTitleLable)
    addSubview(seriesButtonStackView)

    seriesButtonStackView.addArrangedSubview(seriesNumberButton)

    setupConstraints()
  }

  func setupConstraints() {
    bookTitleLable.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.centerX.equalToSuperview()
      make.width.lessThanOrEqualToSuperview().inset(20)
    }

    seriesNumberButton.snp.makeConstraints { make in
      make.width.equalTo(30)
      make.height.equalTo(30)
    }

    seriesButtonStackView.snp.makeConstraints { make in
      make.top.equalTo(bookTitleLable.snp.bottom).offset(16)
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview().inset(10)
    }
  }

  func updateTitle(to newTitle: String) {
      bookTitleLable.text = newTitle
  }
}
