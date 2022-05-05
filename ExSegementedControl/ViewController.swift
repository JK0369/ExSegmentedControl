//
//  ViewController.swift
//  ExSegementedControl
//
//  Created by 김종권 on 2022/05/06.
//

import UIKit

class ViewController: UIViewController {
  let segmentedControl: UISegmentedControl = {
    let control = UISegmentedControl(items: ["firstView", "secondView"])
    control.translatesAutoresizingMaskIntoConstraints = false
    return control
  }()
  let firstView: UIView = {
    let view = UIView()
    view.backgroundColor = .green
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  let secondView: UIView = {
    let view = UIView()
    view.backgroundColor = .yellow
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  
  var shouldHideFirstView: Bool? {
    didSet {
      guard let shouldHideFirstView = self.shouldHideFirstView else { return }
      self.firstView.isHidden = shouldHideFirstView
      self.secondView.isHidden = !self.firstView.isHidden
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    self.view.addSubview(self.segmentedControl)
    self.view.addSubview(self.firstView)
    self.view.addSubview(self.secondView)
    
    NSLayoutConstraint.activate([
      self.segmentedControl.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 16),
      self.segmentedControl.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -16),
      self.segmentedControl.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 80),
      self.segmentedControl.heightAnchor.constraint(equalToConstant: 70),
    ])
    NSLayoutConstraint.activate([
      self.firstView.leftAnchor.constraint(equalTo: self.segmentedControl.leftAnchor),
      self.firstView.rightAnchor.constraint(equalTo: self.segmentedControl.rightAnchor),
      self.firstView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -80),
      self.firstView.topAnchor.constraint(equalTo: self.segmentedControl.bottomAnchor, constant: 16),
    ])
    NSLayoutConstraint.activate([
      self.secondView.leftAnchor.constraint(equalTo: self.firstView.leftAnchor),
      self.secondView.rightAnchor.constraint(equalTo: self.firstView.rightAnchor),
      self.secondView.bottomAnchor.constraint(equalTo: self.firstView.bottomAnchor),
      self.secondView.topAnchor.constraint(equalTo: self.firstView.topAnchor),
    ])
    
    self.segmentedControl.addTarget(self, action: #selector(didChangeValue(segment:)), for: .valueChanged)
    
    self.segmentedControl.selectedSegmentIndex = 0
    self.didChangeValue(segment: self.segmentedControl)
  }
  
  @objc private func didChangeValue(segment: UISegmentedControl) {
    self.shouldHideFirstView = segment.selectedSegmentIndex != 0
  }
}
