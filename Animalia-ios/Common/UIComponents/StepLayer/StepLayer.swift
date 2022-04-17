//
//  StepLayer.swift
//  Animalia-ios
//
//  Created by Sebastian Soto Varas on 16/04/22.
//

import UIKit

protocol StepLayerProtocol {
    func getCurrentStep(_ step: Int16)
}

@IBDesignable
class StepLayer: UIView {
    
    var currentStep: Int16 = 1 { willSet { drawStep(current: newValue) } }
    var delegate: StepLayerProtocol?
    
    @IBInspectable var totalSteps: Int16 = 1
    @IBOutlet weak var detail: UILabel!
    @IBOutlet weak var insideview: UIView!
    @IBOutlet weak var currentStepView: UIView!
    @IBOutlet weak var totalStepView: UIView!
    @IBOutlet weak var widthStep: NSLayoutConstraint!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
    }
    
    private func initialize() {
        insideview = loadViewFromNib()
        setupUI(view: insideview ?? UIView())
        drawStep(current: currentStep)
    }
    
    private func setupView(_ current: Int16) {
        detail.text = "Paso \(current) de \(totalSteps)"
    }
    
    private func drawStep(current: Int16) {
        setupView(current)
        let widthSteps = totalStepView.frame.width
        let newWidth = Double(widthSteps) * (Double(current) / Double(totalSteps))
        widthStep.constant = newWidth
        delegate?.getCurrentStep(current)
    }
    
    func next() {
        if currentStep < totalSteps { currentStep += 1 }
    }
    
    func back() {
        if currentStep > 1 { currentStep -= 1 }
    }
    
    func start() {
        drawStep(current: 1)
    }
}
