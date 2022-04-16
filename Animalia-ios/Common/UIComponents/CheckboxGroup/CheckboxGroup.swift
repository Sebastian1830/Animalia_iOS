//
//  RoleUIButton.swift
//  Animalia-ios
//
//  Created by Sebastian Soto Varas on 12/04/22.
//

import UIKit

protocol CustomCheckboxGroupDelegate {
    func selectCheckbox(_ group: String, _ id: String)
}

@IBDesignable
class CheckboxGroup: UIButton {
    
    // MARK: - properties
    private var callback: (() -> ())?
    var delegate: CustomCheckboxGroupDelegate?

    // MARK: - Outlets and Actions
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var details: UILabel!
    @IBOutlet weak var container: UIView!
    @IBOutlet var insideview: UIView!
    
    @IBInspectable var id: String = ""
    @IBInspectable var group: String = ""
    @IBInspectable var iconItem: UIImage = UIImage() {
        willSet {
            icon.image = newValue
        }
    }
    @IBInspectable var titleItem: String = "" {
        willSet {
            title.text = newValue
        }
    }
    @IBInspectable var detailItem: String = "" {
        willSet {
            details.text = newValue
        }
    }
    
    // MARK: - Lifecycle's Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialize()
        setupView()
    }
    
    // MARK: - Functions
    private func initialize(){
        insideview = loadViewFromNib()
        setupUI(view: insideview ?? UIView())
    }
    
    private func loadViewFromNib() -> UIView! {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
        return nib.instantiate( withOwner: self, options: nil).first as? UIView
    }
    
    private func setupUI(view: UIView?){
        view?.frame = self.bounds
        addSubview(view ?? UIView())
    }
    
    private func setupView() {
        container.backgroundColor = .clear
        container.isOpaque = false
        container.layer.borderWidth = 2
        container.layer.borderColor = UIColor(named: Colors.BorderColor.rawValue)?.cgColor
        container.layer.masksToBounds = true
        container.layer.cornerRadius = 25
    }
    
    private func defaultDesignable() {
        self.iconItem = UIImage()
        self.titleItem = ""
        self.detailItem = ""
    }
    
    public func handleCustomTap(_ handler: @escaping () -> ()) {
        self.callback = handler
    }
    
    public func selectStyleFor(_ group: String, _ id: String) {
        if self.group == group && self.id == id {
            container.layer.borderColor = UIColor(named: Colors.PrimaryColor.rawValue)?.cgColor
        } else {
            container.layer.borderColor = UIColor(named: Colors.BorderColor.rawValue)?.cgColor
        }
    }
    
    func actionSelected() {
        delegate?.selectCheckbox(group, id)
    }
}
