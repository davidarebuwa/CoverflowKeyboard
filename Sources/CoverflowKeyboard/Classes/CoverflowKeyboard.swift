//
//  CoverflowKeyboard.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.

import UIKit

public final class CoverflowKeyboard {
    internal var inputView : CoverFlowInputView?
    public var delegate: CoverflowDelegate?
    public var data: [CellData] = []
  
    public init() { }
    public init(delegate: CoverflowDelegate?, data: [CellData]?) {
        self.delegate = delegate
        self.data = data ?? []
    }

}
