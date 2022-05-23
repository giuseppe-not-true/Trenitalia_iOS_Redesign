//
//  DatePickerTextChangingExtension.swift
//  Trenitalia
//
//  Created by Giuseppe Falso on 14/12/21.
//

import Foundation
import SwiftUI

extension View {
    @ViewBuilder func changeTextColor(_ color: Color) -> some View {
        if UITraitCollection.current.userInterfaceStyle == .light {
            self.colorInvert().colorMultiply(color)
        } else {
            self.colorMultiply(color)
        }
    }
}
