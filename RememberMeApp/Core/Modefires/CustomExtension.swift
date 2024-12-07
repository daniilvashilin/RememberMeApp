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
extension Double {
    func formattedTime() -> String {
        let minutes = Int(self) / 60
        let seconds = Int(self) % 60
        let milliseconds = Int((self - Double(Int(self))) * 100)
        return String(format: "%02d:%02d:%02d", minutes, seconds, milliseconds)
    }
}

extension Timer {
    static func setUpTimer(isRunning: Binding<Bool>, timerElapsed: Binding<Double>, timeElapsedResult: Binding<Double>) {
        Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
            if isRunning.wrappedValue {
                timerElapsed.wrappedValue += 0.01
                timeElapsedResult.wrappedValue += 0.01
            }
        }
    }
}



//private func setupTimer() {
//    Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true) { timer in
//        if isRuning {
//            timeElapsed += 0.01
//            timeElapsedResualt += 0.01
//        }
//    }
//}
