//
//  CustomModifiers.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import Foundation
import SwiftUI

struct CustomTabStyle: ViewModifier {
    let font: Font
    let foregroundStyle: Color
    
    func body(content: Content) -> some View {
        content
            .font(font)
            .foregroundStyle(foregroundStyle)
    }
}


struct CustomDefualtButtonStyle: ViewModifier {
    let width: CGFloat
    let height: CGFloat
    let backgroundColor: Color
    let cornerRadius: CGFloat
    let textColor: Color
    func body(content: Content) -> some View {
        content
            .buttonStyle(PlainButtonStyle())
            .frame(width: width, height: height)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: cornerRadius))
            .foregroundStyle(textColor)
    }
}

struct CustomSettingsButtonForList: ViewModifier {
    let textColor: Color
    let font: Font
    func body(content: Content) -> some View {
        content
            .foregroundStyle(textColor)
            .font(font)
    }
}






