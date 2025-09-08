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

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupConfigures()
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension MainView {
  func setupConfigures() {
    backgroundColor = .systemBackground
  }

  func setupViews() {
    addSubview(headerView)

    setupConstraints()
  }

  func setupConstraints() {
    headerView.snp.makeConstraints { make in
      make.top.equalTo(self.safeAreaLayoutGuide).offset(10)
      make.leading.trailing.equalToSuperview()
    }
  }

  func updateTitle(to newTitle: String) {
      headerView.updateTitle(to: newTitle)
  }
}
