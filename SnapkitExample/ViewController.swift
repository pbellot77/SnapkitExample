//
//  ViewController.swift
//  SnapkitExample
//
//  Created by Patrick Bellot on 3/6/18.
//  Copyright © 2018 Polestar Interactive LLC. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

	let mainView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor(white: 0.6, alpha: 0.4)
		view.layer.cornerRadius = 20
		return view
	}()
	
	let redView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.red
		view.layer.cornerRadius = 20
		return view
	}()
	
	let blueView: UIView = {
		let view = UIView()
		view.backgroundColor = UIColor.blue
		view.layer.cornerRadius = 20
		return view
	}()
	
	lazy var stackView: UIStackView = {
		// remember to add 'arrangedSubviews' to stackview
		let stackView = UIStackView(arrangedSubviews: [redView, blueView])
		stackView.axis = .vertical
		stackView.distribution = .fillEqually
		stackView.spacing = 20
		return stackView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setup()
		setupViews()
	}

	func setup() {
		view.backgroundColor = .white
	
		navigationController?.navigationBar.prefersLargeTitles = true
		navigationController?.navigationBar.barStyle = .blackOpaque
		navigationItem.title = "Snapkit Example"
		navigationController?.navigationBar.barTintColor = .black
		let attributes = [NSAttributedStringKey.foregroundColor: UIColor.white]
		navigationController?.navigationBar.largeTitleTextAttributes = attributes
		
	}
	
	func setupViews() {
		
		view.addSubview(mainView)
		mainView.addSubview(stackView)
		
		mainView.snp.makeConstraints { (make) in
			make.topMargin.left.equalTo(20)
			make.bottom.right.equalTo(-20)
		}
		
		stackView.snp.makeConstraints { (make) in
			make.topMargin.left.equalTo(20)
			make.center.equalTo(self.mainView)
		}
	}
}

