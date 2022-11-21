//
//  backgroundStyle.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

struct BackgroundStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .RadialGradient(
            colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))],
            center: .topTrailing,
            startRadius: 50,
            endRadius: UIScreen.main.bounds.height)
    )
    }
}
