//
//  CoverflowKeyboard.swift
//  CoverflowKeyboard
//
//  Created by Dominic Drees on 06.07.20.
//  this will be the wrapper thats accessible from outside
// needs to be extra configurable ( to maximise user happines )

// make all classes private that should not be accessible from outside
// make all classes final that should not be subclassed from outside aswell :P

import UIKit

public final class CoverflowKeyboard {
    var inputView : CoverFlowInputView?
    var data: [CellData] = []
  
    public init(){
        inputView = CoverFlowInputView()
    }
}
