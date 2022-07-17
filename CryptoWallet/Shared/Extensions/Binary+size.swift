//
//  Binary+size.swift
//  CryptoWallet
//
//  Created by Dmytro Krupskyi on 17.07.2022.
//

import UIKit

extension BinaryFloatingPoint {
    
    /// iPhone X
    var deviceScreenSize: CGSize {
        CGSize(width: 375, height: 812)
    }
    
    var sizeW: CGFloat {
        CGFloat(self) * UIScreen.main.bounds.width / deviceScreenSize.width
    }
    
    var sizeH: CGFloat {
        CGFloat(self) * UIScreen.main.bounds.height / deviceScreenSize.height
    }
    
}

extension BinaryInteger {
    
    var sizeW: CGFloat {
        CGFloat(self).sizeW
    }
    
    var sizeH: CGFloat {
        CGFloat(self).sizeH
    }
    
}
