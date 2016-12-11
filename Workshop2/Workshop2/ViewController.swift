//
//  ViewController.swift
//  Workshop2
//
//  Created by Kuba Reinhard on 11.12.2016.
//  Copyright © 2016 Kuba Reinhard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rectangleView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let printString: String = someString()
        let number: Int = 5
        let str: String = "My number: \(number) \(printString)"
        print(str)
        print("My number: \(number) \(printString)")
        
        self.simpleFunction()
        self.simpleFunction2()
    }
    
    @IBAction func tap(_ sender: Any) {
        self.rectangleView.backgroundColor = UIColor.blue
    }
    
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        let selectedIndex: Int = self.segmentedControl.selectedSegmentIndex
        
        switch selectedIndex {
        case 0:
            self.rectangleView.backgroundColor = UIColor.red
        case 1:
            self.rectangleView.backgroundColor = UIColor.orange
        default:
            self.rectangleView.backgroundColor = UIColor.purple
        }
    }
    
    func someString() -> String {
        return "This is some random string"
    }
    
    func simpleFunction() -> Void {
        print("simpleFunction")
    }
    
    func simpleFunction2() {
       print("simpleFunction2")
    }
}
