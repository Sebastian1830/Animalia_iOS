//
//  EntityWireframe.swift
//  Animalia-ios
//
//  Created by Sebastian Soto Varas on 16/04/22.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the 🐍 VIPER generator
//

import UIKit

final class EntityWireframe: BaseWireframe<EntityViewController> {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "Entity", bundle: nil)

    // MARK: - Module setup -

    init() {
        let moduleViewController = storyboard.instantiateViewController(ofType: EntityViewController.self)
        super.init(viewController: moduleViewController)

        let interactor = EntityInteractor()
        let presenter = EntityPresenter(view: moduleViewController, interactor: interactor, wireframe: self)
        moduleViewController.presenter = presenter
    }

}

// MARK: - Extensions -

extension EntityWireframe: EntityWireframeInterface {
}
