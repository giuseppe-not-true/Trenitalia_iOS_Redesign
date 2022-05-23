//
//  BlurView.swift
//  Trenitalia (iOS)
//
//  Created by Giuseppe Falso on 15/12/21.
//

import Foundation
import SwiftUI

struct BlurView: UIViewRepresentable {
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIVisualEffectView(
            effect: UIBlurEffect(style: style)
        )
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //        do nothing
    }
}
