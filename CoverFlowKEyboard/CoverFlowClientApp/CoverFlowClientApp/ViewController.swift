//
//  ViewController.swift
//  CoverFlowClientApp
//
//  Created by Us on 05/07/2020.
//

import UIKit
import CoverFlowKeyboard


class ViewController: UIViewController {
    
    var emojiButton: UIButton = UIButton()
    var imageButton: UIButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad() 
        // Do any additional setup after loading the view.
        
        emojiButton.setup(title: "Emoji", x: 100, y: 430, width: 220, height: 80, color: .label)
        emojiButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        emojiButton.setTitleColor(.systemBlue, for: .normal)
        
        imageButton.setup(title: "Image", x: 100, y: 200, width: 220, height: 80, color: .label)
        imageButton.addTarget(self, action: #selector(imageButtonAction), for: .touchUpInside)
        imageButton.setTitleColor(.systemBlue, for: .normal)
        
        
        
        self.view.addSubview(emojiButton)
        self.view.addSubview(imageButton)
    }
    
    @objc func buttonAction(sender: UIButton!) {
       print("Button tapped")
        let dummyTF = UITextField(frame: .zero)
        dummyTF.placeholder = "Emoji Coverflow"
        emojiButton.addSubview(dummyTF)
        dummyTF.inputView = CoverFlowEmojiView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
        dummyTF.becomeFirstResponder()
    }
    
    @objc func imageButtonAction(sender: UIButton!) {
       print("Button tapped")
        let dummyTF = UITextField(frame: .zero)
        dummyTF.placeholder = "ImageCoverflow"
        emojiButton.addSubview(dummyTF)
        dummyTF.inputView = CoverFlowImageView(frame: CGRect(x: 0, y: 0, width: 500, height: 300))
        dummyTF.becomeFirstResponder()
    }


}

extension UIButton {
    func setup(title: String, x: CGFloat, y: CGFloat, width: CGFloat, height: CGFloat, color: UIColor){
        frame = CGRect(x: x, y: y, width: width, height: height)
        backgroundColor = color
        setTitle(title , for: .normal)
        }
    }


