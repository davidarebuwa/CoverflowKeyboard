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
    private var keyboard: CoverflowKeyboard?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        keyboard = CoverflowKeyboard(delegate: self, data: [
            CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
            CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
            CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
            CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
            CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle")
        ])
        
        fromButton.add(keyboard: keyboard!)
        fromTextfield.add(keyboard: keyboard!)
    }
    
    func didSelect(with keyboard: CoverflowKeyboard, cellAt indexPath: IndexPath) {
        print("[Delegate] Cell selected: \(indexPath) -> \(keyboard.data[indexPath.row].cellType.rawValue)")
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch(indexPath.section, indexPath.row) {
        case (0, 2):
            let cell = tableView.cellForRow(at: indexPath)
            cell?.contentView.present(keyboard: keyboard!)
        case (1, 0):
            let cell = tableView.cellForRow(at: indexPath)
            let temp = CoverflowKeyboard(delegate: self, data: [
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle")
            ])
            cell?.contentView.present(keyboard: temp)
        case (1, 1):
            let cell = tableView.cellForRow(at: indexPath)
            let temp = CoverflowKeyboard(delegate: self, data: [
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle")
            ])
            cell?.contentView.present(keyboard: temp)
        case (1, 2):
            let cell = tableView.cellForRow(at: indexPath)
            let temp = CoverflowKeyboard(delegate: self, data: [
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle"),
                CellData(cellType: .emojiCell, title: "title", image: nil, subtitle: "subtitle")
            ])
            cell?.contentView.present(keyboard: temp)
        default:
            return
        }
    }

}
