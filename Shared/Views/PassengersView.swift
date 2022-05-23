//
//  Passengers.swift
//  Trenitalia
//
//  Created by Giuseppe Falso on 14/12/21.
//

import Foundation
import SwiftUI

struct PassengersView : View {
    @Binding var adultPassengerSelection: Int
    @Binding var childPassengerSelection: Int
    
    var body: some View {
        
        VStack {
            Spacer()
            VStack{
                HStack{
                    Text("Adults")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Stepper("\(adultPassengerSelection)", value: $adultPassengerSelection, in: 0...100)
                        .padding()
                }
                HStack {
                    Text("Children")
                        .font(.callout)
                        .fontWeight(.semibold)
                    Stepper("\(childPassengerSelection)", value: $childPassengerSelection, in: 0...100)
                        .padding()
                }
            }
            .padding()
            .frame(width: .infinity, height: 150, alignment: .bottom)
            .background(.background)
            .cornerRadius(20)
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct Passengers_Preview: PreviewProvider {
    static var previews: some View {
        PassengersView(adultPassengerSelection: .constant(0), childPassengerSelection: .constant(0))
    }
}
