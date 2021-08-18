//
//  CoverflowKeyboard.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.

import UIKit

@available(iOS 11.0, *)
public final class CoverflowKeyboard: Equatable {
    
    public static func == (lhs: CoverflowKeyboard, rhs: CoverflowKeyboard) -> Bool {
        return lhs.tag == rhs.tag
    }
    
    internal var inputView : CoverFlowInputView?
    public var delegate: CoverflowDelegate?
    public var data: [CellData] = []
    public var tag: Int = 0
  
    public init() { }
    public init(delegate: CoverflowDelegate?, data: [CellData]?, _ tag: Int = 0) {
        self.tag = tag
        self.delegate = delegate
        self.data = data ?? []
        inputView = CoverFlowInputView(.zero, self)
    }

}
