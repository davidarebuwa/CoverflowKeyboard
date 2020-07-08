//
//  ViewController.swift
//  CoverflowKeyboard_Example
//
//  Created by Dominic Drees on 06.07.20.
//  Copyright © 2020 CocoaPods. All rights reserved.
//

import UIKit
import CoverflowKeyboard

class ViewController: UITableViewController {
    
    @IBOutlet weak var sampleButton: UIButton!
    @IBOutlet weak var sampleBarButton: UIBarButtonItem!
    @IBOutlet weak var sampleTextField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupSampleButton()
    }
    
    func setupSampleButton(){
        let dummyTF = UITextField(frame: .zero)
        dummyTF.placeholder = "Emoji Coverflow"
        sampleButton.addSubview(dummyTF)
       //Coverflow stuff
        let coverFlow = CoverflowKeyboard()
       
        
        dummyTF.becomeFirstResponder()
    }
    
    func emojiCoverFlow(){}
    func imageCoverFlow(){}
    func customCoverFlow(){}
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        super.tableView(tableView, didSelectRowAt: indexPath)
        switch(indexPath.section, indexPath.row) {
        case (0, 0):
            print("selected")
        
        default:
            print("selected")
        }
    }
}
