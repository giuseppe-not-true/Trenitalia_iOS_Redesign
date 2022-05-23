//
//  DetailedTicketModel.swift
//  Trenitalia
//
//  Created by Giuseppe Falso on 13/12/21.
//

import Foundation
import SwiftUI

struct DetailedTicket: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var depStation: String
    @Binding var arrStation: String
    @Binding var trainService: String
    @Binding var trainNumber: String
    @Binding var ticketCode: String
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 350, height: geometry.size.height/4)
                        .foregroundColor(Color.trenitaliaRed)
                        .overlay{
                            HStack {
                                VStack(alignment: .leading, spacing: 15){
                                    Text("Passenger Details")
                                        .foregroundColor(.white)
                                        .font(.title2)
                                        .fontWeight(.semibold)
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Name")
                                            .foregroundColor(.white)
                                            .font(.callout)
                                            .fontWeight(.medium)
                                        Text("Giuseppe Falso")
                                            .foregroundColor(.white)
                                            .font(.caption)
                                            .fontWeight(.regular)
                                    }
                                    HStack(spacing: geometry.size.width/6) {
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("CartaFreccia")
                                                .foregroundColor(.white)
                                                .font(.callout)
                                                .fontWeight(.medium)
                                            Text("KN657G2399")
                                                .foregroundColor(.white)
                                                .font(.caption)
                                                .fontWeight(.regular)
                                                .frame(maxWidth: geometry.size.width/5)
                                        }
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Ticket Code")
                                                .foregroundColor(.white)
                                                .font(.callout)
                                                .fontWeight(.medium)
                                            Text(String(ticketCode))
                                                .foregroundColor(.white)
                                                .font(.caption)
                                                .fontWeight(.regular)
                                        }
                                    }
                                }
                                .padding()
                                Spacer()
                            }
                            .padding()
                        }
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 350, height: geometry.size.height*(3/4))
                        .foregroundColor(Color.trenitaliaRed)
                        .overlay {
                            VStack(spacing: 20){
                                HStack(alignment: .top) {
                                    VStack(alignment: .leading, spacing: 15){
                                        Text("Train Details")
                                            .foregroundColor(.white)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                        VStack(alignment: .leading, spacing: 4) {
                                            Text("Departure Station")
                                                .foregroundColor(.white)
                                                .font(.callout)
                                                .fontWeight(.medium)
                                            Text("\(depStation)")
                                                .foregroundColor(.white)
                                                .font(.caption)
                                                .fontWeight(.regular)
                                        }
                                        VStack(alignment: .leading){
                                            Text("Arrival Station")
                                                .foregroundColor(.white)
                                                .font(.callout)
                                                .fontWeight(.medium)
                                            Text("\(arrStation)")
                                                .foregroundColor(.white)
                                                .font(.caption)
                                                .fontWeight(.regular)
                                        }
                                        
                                        HStack(spacing: geometry.size.width/4) {
                                            VStack(alignment: .leading, spacing: 15) {
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text("Service")
                                                        .foregroundColor(.white)
                                                        .font(.callout)
                                                        .fontWeight(.medium)
                                                    Text("\(trainService)")
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                        .fontWeight(.regular)
                                                }
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text("Coaches")
                                                        .foregroundColor(.white)
                                                        .font(.callout)
                                                        .fontWeight(.medium)
                                                    Text("- -")
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                        .fontWeight(.regular)
                                                }
                                            }
                                            
                                            VStack(alignment: .leading, spacing: 15) {
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text("Train Number")
                                                        .foregroundColor(.white)
                                                        .font(.callout)
                                                        .fontWeight(.medium)
                                                    Text(String(trainNumber))
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                        .fontWeight(.regular)
                                                }
                                                VStack(alignment: .leading, spacing: 4) {
                                                    Text("Seats")
                                                        .foregroundColor(.white)
                                                        .font(.callout)
                                                        .fontWeight(.medium)
                                                    Text("- -")
                                                        .foregroundColor(.white)
                                                        .font(.caption)
                                                        .fontWeight(.regular)
                                                }
                                            }
                                        }
                                    }
                                    .padding()
                                    
                                    Spacer()
                                }
                                Spacer()
                                Image(uiImage: UIImage(named:"qrcode")!)
                                    .resizable()
                                    .frame(width: 200, height: 200, alignment: .center)
                                    .aspectRatio(1, contentMode: .fit)
                                    .cornerRadius(25)
                                Spacer()
                            }
                            .padding()
                        }
                    
                }
                .padding(.top)
                .frame(width: geometry.size.width, height: geometry.size.height, alignment: .center)
            }
//            .navigationBarColor(backgroundColor: .clear, tintColor: UIColor(Color.textColor))
            .navigationBarTitleDisplayMode(.inline)
            .navigationTitle("Your Ticket")
            .navigationBarItems(leading: Button("\(Image(systemName: "chevron.left"))Tickets") {
                presentationMode.wrappedValue.dismiss()
            }
//                                    .foregroundColor(Color(UIColor.systemBlue))
            )
        }
    }
}

struct DetailedTicket_Preview: PreviewProvider {
    static var previews: some View {
        DetailedTicket(depStation: .constant(""), arrStation: .constant(""), trainService: .constant(""), trainNumber: .constant(""), ticketCode: .constant(""))
    }
}
