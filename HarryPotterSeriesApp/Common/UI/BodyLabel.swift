//
//  BodyLabel.swift
//  HarryPotterSeriesApp
//
//  Created by 김민희 on 9/11/25.
//

import UIKit

final class BodyLabel: UILabel {
  init(fontSize: CGFloat, textColor: UIColor) {
    super.init(frame: .zero)
    self.font = .systemFont(ofSize: fontSize)
    self.textColor = textColor
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
