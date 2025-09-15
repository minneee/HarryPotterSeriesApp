//
//  TitleLabel.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/11/25.
//
import UIKit

final class TitleLabel: UILabel {
  init(fontSize: CGFloat) {
    super.init(frame: .zero)
    self.font = .systemFont(ofSize: fontSize, weight: .bold)
    self.textColor = .black
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
