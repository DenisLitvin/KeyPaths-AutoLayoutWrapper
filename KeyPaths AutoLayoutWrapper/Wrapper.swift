//
//  Wrapper.swift
//  KeyPaths AutoLayoutWrapper
//
//  Created by Litvin, Denis [GCB-OT] on 11/1/18.
//  Copyright © 2018 Litvin, Denis [GCB-OT]. All rights reserved.
//

import UIKit

typealias Constraint = (UIView, UIView) -> NSLayoutConstraint

extension UIView {
    func addSubview(_ other: UIView, constraints: [Constraint]) {
        other.translatesAutoresizingMaskIntoConstraints = false
        addSubview(other)
        addConstraints(constraints.map { $0(other, self) })
    }
}

func equal<L, Axis>(_ to: KeyPath<UIView, L>,
                    constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return equal(to, to, constant: constant)
}

func equal<L, Axis>(_ from: KeyPath<UIView, L>,
                    _ to: KeyPath<UIView, L>,
                    constant: CGFloat = 0) -> Constraint where L: NSLayoutAnchor<Axis> {
    return { view1, view2 in
        view1[keyPath: from].constraint(equalTo: view2[keyPath: to], constant: constant)
    }
}

func equal<L>(_ keyPath: KeyPath<UIView, L>, constant: CGFloat) -> Constraint where L: NSLayoutDimension {
    return { view1, _ in
        view1[keyPath: keyPath].constraint(equalToConstant: constant)
    }
}

