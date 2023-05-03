//
//  ViewController.swift
//  AutoConstraintExample
//
//  Created by Dayo Banjo on 5/2/23.
//
import UIKit
import AutoConstraint

class ViewController: UIViewController {
    
    lazy var testView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(testView)
        testView.backgroundColor = .blue
        testView.centerInSuperview(size: CGSize(width: 300, height: 200))
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

