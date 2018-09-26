//
//  PreferenceView.swift
//  JustEat
//
//  Created by Daniel Yen on 9/9/18.
//  Copyright © 2018 Daniel Yen. All rights reserved.
//

import UIKit

class PreferenceView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(backgroundView)
        self.addSubview(mainStack)
        
        mainStack.addArrangedSubview(buttonsStack)
        buttonsStack.addArrangedSubview(UIView(frame: .zero))
        buttonsStack.addArrangedSubview(mealButton)
        buttonsStack.addArrangedSubview(dessertButton)
        buttonsStack.addArrangedSubview(UIView(frame: .zero))
    }
    
    private func setupConstraints() {
        mainStack.pinEdges(to: self)
        backgroundView.pinEdges(to: self)
        
    }
    
    // MARK: - Views
    
    let backgroundView: UIView = {
       let view = UIView(frame: .zero)
        view.backgroundColor = .red
        return view
    }()
    
    let mainStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        stackView.isLayoutMarginsRelativeArrangement = true
        stackView.layoutMargins = UIEdgeInsets(top: 10, left: 30, bottom: 30, right: 30)
        return stackView
    }()
    
    let mealButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Meal", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let dessertButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Dessert", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        button.setTitleColor(.white, for: .normal)
        return button
    }()
    
    let buttonsStack: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        stackView.axis = .horizontal
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        return stackView
    }()
}


