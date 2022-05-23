//
//  TicketModel.swift
//  Trenitalia
//
//  Created by Giuseppe Falso on 12/12/21.
//

import Foundation
import SwiftUI

struct TicketModel: View, Identifiable, Hashable {
    @State var id = UUID()
    @Binding var depStation: String
    @Binding var arrStation: String
    @Binding var trainService: String
    @Binding var trainNumber: String
    @Binding var ticketCode: String
    @State private var showingTicketSheet = false
    var serialNumber = 0
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(serialNumber)
    }
    
    static func == (lhs: TicketModel, rhs: TicketModel) -> Bool {
        return (lhs.depStation == rhs.depStation && lhs.arrStation == rhs.arrStation && lhs.trainService == rhs.trainService && lhs.trainNumber == rhs.trainNumber && lhs.ticketCode == rhs.ticketCode)
    }
    
    var body: some View {
        RoundedRectangle(cornerRadius: 10)
            .frame(width: 350, height: 200)
            .foregroundColor(Color.trenitaliaRed)
            .overlay {
                HStack {
                    VStack(alignment: .leading, spacing: 20) {
                        HStack(alignment: .top) {
                            VStack (alignment: .leading, spacing: 20) {
                                VStack (alignment: .leading) {
                                    Text("Departure Station")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    Text(depStation)
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                                VStack (alignment: .leading) {
                                    Text("Arrival Station")
                                        .foregroundColor(.white)
                                        .font(.title3)
                                        .fontWeight(.medium)
                                    Text(arrStation)
                                        .foregroundColor(.white)
                                        .font(.caption)
                                }
                            }
                            Spacer()
                            Image(uiImage: UIImage(named:"qrcode")!)
                                .resizable()
                                .frame(width: 80, height: 80, alignment: .topTrailing)
                                .aspectRatio(1, contentMode: .fit)
                                .cornerRadius(10)
                        }
                        HStack{
                            VStack(alignment: .leading) {
                                Text("Train")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.medium)
                                Text("\(trainService) " + "\(trainNumber)")
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                            Spacer()
                            VStack(alignment: .leading) {
                                Text("Ticket Code")
                                    .foregroundColor(.white)
                                    .font(.title3)
                                    .fontWeight(.medium)
                                Text(String(ticketCode))
                                    .foregroundColor(.white)
                                    .font(.caption)
                            }
                        }
                    }
                    .padding(20)
                    Spacer()
                }
            }
            .onTapGesture {
                showingTicketSheet.toggle()
            }.sheet(isPresented: $showingTicketSheet) {
                DetailedTicket(depStation: $depStation, arrStation: $arrStation, trainService: $trainService, trainNumber: $trainNumber, ticketCode: $ticketCode)
            }
    }
}

struct TicketModel_Preview: PreviewProvider {
    static var previews: some View {
        TicketModel(id: UUID(), depStation: .constant(""), arrStation: .constant(""), trainService: .constant(""), trainNumber: .constant(""), ticketCode: .constant(""))
    }
}
