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
    stackView.alignment = .center
    stackView.spacing = 8
    return stackView
  }()

  var onSeriesButtonTapped: ((Int) -> Void)?

  //MARK: - initialize
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

  func setupSeriesButton(count: Int) {
    seriesButtonStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }

    for i in 0..<count {
      let button = UIButton()
      button.setTitle("\(i + 1)", for: .normal)
      button.backgroundColor = .systemBlue
      button.titleLabel?.font = .systemFont(ofSize: 16)
      button.layer.cornerRadius = 15

      seriesButtonStackView.addArrangedSubview(button)

      button.tag = i
      button.addTarget(self, action: #selector(seriesButtonAction(_:)), for: .touchUpInside)

      button.snp.makeConstraints { make in
        make.width.height.equalTo(30)
      }
    }
  }

  @objc private func seriesButtonAction(_ sender: UIButton) {
    onSeriesButtonTapped?(sender.tag)
  }



}

extension HeaderView {
  func setupConfigures() {
    backgroundColor = .systemBackground
  }

  func setupViews() {
    addSubview(bookTitleLable)
    addSubview(seriesButtonStackView)

    setupConstraints()
  }

  func setupConstraints() {
    bookTitleLable.snp.makeConstraints { make in
      make.top.equalToSuperview()
      make.centerX.equalToSuperview()
      make.leading.trailing.equalToSuperview().inset(20)
    }

    seriesButtonStackView.snp.makeConstraints { make in
      make.top.equalTo(bookTitleLable.snp.bottom).offset(16)
      make.centerX.equalToSuperview()
      make.bottom.equalToSuperview()
    }
  }

  func updateTitle(to newTitle: String) {
      bookTitleLable.text = newTitle
  }

}
