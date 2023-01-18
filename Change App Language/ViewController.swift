//
//  ViewController.swift
//  Change App Language
//
//  Created by Dhananjay on 15/01/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        label1.text = "FirstNameKey".localizableString(loc: "en")
        label2.text = "LastNameKey".localizableString(loc: "en")
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        // no logic, only for testing purpose of view will transition ... dhananjay
        label1.text = "FirstNameKey".localizableString(loc: "hi")
        label2.text = "LastNameKey".localizableString(loc: "hi")
    }

    @IBAction func changeLanguageOnSegmentChange(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0{ // english
            label1.text = "FirstNameKey".localizableString(loc: "en")
            label2.text = "LastNameKey".localizableString(loc: "en")
        }else{ // hindi
            label1.text = "FirstNameKey".localizableString(loc: "hi")
            label2.text = "LastNameKey".localizableString(loc: "hi")
        }
    }
    
}

extension String{
    func localizableString(loc: String) -> String{
        let path = Bundle.main.path(forResource: loc, ofType: "lproj")
        let bundle = Bundle(path: path!)
        return NSLocalizedString(self, tableName: nil, bundle: bundle!, value: "", comment: "")
    }
}
