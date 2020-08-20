//
//  ViewControllerAssembly.swift
//  Mobillium Movie
//
//  Created by Mehmet Tarhan on 20.08.2020.
//  Copyright © 2020 Mehmet Tarhan. All rights reserved.
//

import Foundation
import Swinject

class ViewControllerAssembly: Assembly {
    private let assembler: Assembler

    init(assembler: Assembler) {
        self.assembler = assembler
    }

    func assemble(container: Container) {
        container.register(ViewControllerFactory.self) { _ in
            ViewControllerFactoryImpl(assembler: self.assembler)
        }
    }
}
