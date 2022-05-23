//
//  TicketContainerModel.swift
//  Trenitalia (iOS)
//
//  Created by Giuseppe Falso on 15/12/21.
//

import Foundation
import SwiftUI

class TicketContainer: ObservableObject {
    @Published var tickets = [TicketModel]()
    
    init () {
    }
}
