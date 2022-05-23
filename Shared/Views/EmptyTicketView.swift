//
//  EmptyTicketModel.swift
//  Trenitalia
//
//  Created by Giuseppe Falso on 14/12/21.
//

import Foundation
import SwiftUI

struct EmptyTicketView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(maxWidth: .infinity, maxHeight: 200)
            .foregroundColor(Color.trenitaliaRed)
            .overlay {
                VStack(spacing: 35) {
                    Image(systemName: "figure.wave")
                        .resizable()
                        .scaledToFit()
                        .foregroundColor(.white)
                    VStack {
                        Text("There’s no ticket here…")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.medium)
                        Text("Tap the plus button to buy one")
                            .foregroundColor(.white)
                            .font(.title3)
                            .fontWeight(.medium)
                    }
                }
                .padding()
            }
            .padding(.horizontal)
    }
}

struct EmptyTicketModel_Preview: PreviewProvider {
    static var previews: some View {
        EmptyTicketView()
    }
}
