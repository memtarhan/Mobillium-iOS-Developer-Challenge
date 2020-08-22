//
//  ViewControllerFactory.swift
//  Mobillium Movie
//
//  Created by Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Foundation
import Swinject

protocol ViewControllerFactory {
    var details: DetailsViewController { get }
    var list: ListViewController { get }
    var search: SearchViewController { get }
}

class ViewControllerFactoryImpl: ViewControllerFactory {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    var details: DetailsViewController { assembler.resolver.resolve(DetailsViewController.self)! }
    var list: ListViewController { assembler.resolver.resolve(ListViewController.self)! }
    var search: SearchViewController { assembler.resolver.resolve(SearchViewController.self)! }
}
