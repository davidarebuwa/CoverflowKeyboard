//
//  ViewController.swift
//  CoverflowKeyboard_Example
//
//  Created by Dominic Drees on 06.07.20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import CoverflowKeyboard

class ViewController: UITableViewController, CoverflowDelegate {
    
    @IBOutlet weak var fromButton: UIButton!
    @IBOutlet weak var fromTextfield: UITextField!
    let keyboard = CoverflowKeyboard()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard.delegate = self

        fromButton.add(keyboard: keyboard)
        fromTextfield.add(keyboard: keyboard)
    }
    
    func didSelect(cellAt indexPath: IndexPath) {
        print("cell selected: \(indexPath)")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(indexPath.section, indexPath.row) {
        case (0, 2):
            let cell = tableView.cellForRow(at: indexPath)
            cell?.present(keyboard: keyboard)
        case (1, 0):
            print("view cell")
        case (1, 1):
            print("view cell")
        case (1, 2):
            print("view cell")
        default:
            return
        }
    }

}
