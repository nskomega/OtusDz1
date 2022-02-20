//
//  LazyView.swift
//  DanilovDZ1
//
//  Created by Mikhail Danilov on 20.02.2022.
//

import SwiftUI

struct LazyView<Content: View>: View {

    private let build: () -> Content
    
    init(_ build: @autoclosure @escaping () -> Content) {
        self.build = build
    }

    var body: Content {
        build()
    }
}
