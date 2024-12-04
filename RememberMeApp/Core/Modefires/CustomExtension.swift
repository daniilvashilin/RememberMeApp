//
//  CustomExtension.swift
//  RememberMeApp
//
//  Created by Daniil on 04/12/2024.
//

import Foundation
import SwiftUI

extension View {
    func getCustomTabStyle(font: Font = .largeTitle, foregroundStyle: Color = .white) -> some View {
        modifier(CustomTabStyle(font: .largeTitle, foregroundStyle: .white))
    }
}


extension View {
    func getCustomButtonStyle(width: CGFloat = 200, height: CGFloat = 60, cornderRadius: CGFloat = 15, bakcGroundColor: Color = .green, textColor: Color = .white) -> some View {
        modifier(CustomDefualtButtonStyle(width: width, height: height, backgroundColor: bakcGroundColor, cornerRadius: cornderRadius, textColor: textColor))
    }
}

extension View {
    func getCustomSettingsButtonForList(textColor: Color = .black, font: Font = .footnote) -> some View {
        modifier(CustomSettingsButtonForList(textColor: textColor, font: font))
    }
}
