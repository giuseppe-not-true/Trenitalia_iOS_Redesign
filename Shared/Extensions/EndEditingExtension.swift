//
//  EndEditingExtension.swift
//  Trenitalia (iOS)
//
//  Created by Giuseppe Falso on 15/12/21.
//

import Foundation
import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
