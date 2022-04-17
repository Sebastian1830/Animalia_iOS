//
//  ExtUIView.swift
//  Animalia-ios
//
//  Created by Sebastian Soto Varas on 16/04/22.
//

import Foundation
import UIKit

extension UIView {
    func setupUI(view: UIView?){
        view?.frame = self.bounds
        addSubview(view ?? UIView())
    }
    
    func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate( withOwner: self, options: nil).first as? UIView
    }
}
