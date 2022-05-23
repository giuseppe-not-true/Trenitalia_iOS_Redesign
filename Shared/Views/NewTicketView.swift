//
//  NewTicketView.swift
//  Trenitalia
//
//  Created by Giuseppe Falso on 13/12/21.
//

import Foundation
import SwiftUI

func randomString(length: Int) -> String {
  let letters = "0123456789"
  return String((0..<length).map{ _ in letters.randomElement()! })
}

struct NewTicketView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var showingNewTicketSheet: Bool
    @Binding var tickets: [TicketModel]
    @State private var newTicket = TicketModel(depStation: .constant(""), arrStation: .constant(""), trainService: .constant(""), trainNumber: .constant(""), ticketCode: .constant(""))
    @State var journeyType = ["One-way", "Round-trip", "Subscriptions"]
    @State private var depStation = ""
    @State private var tempStation = ""
    @State private var arrStation = ""
    @State private var directTrains = false
    @State private var selectedJourney = 0
    @State private var rectangleHeight = 200
    @State private var adultPassengerSelection = 0
    @State private var childPassengerSelection = 0
    @State private var randomTrainNumber = randomString(length: 6)
    @State private var randomTicketCode = randomString(length: 6)
    @State private var showPeopleSheet = false
    @State private var isEditingDep = false
    @State private var isEditingArr = false
    
    var body: some View {
//        NavigationView {
            ZStack {
                GeometryReader { geometry in
                    VStack {
                        VStack(alignment: .leading, spacing: 55) {
                            VStack(alignment: .leading, spacing: 20) {
                                HStack {
                                    Button(action: {
                                        tempStation = depStation
                                        depStation = arrStation
                                        arrStation = tempStation
                                    })
                                    {
                                        Image(systemName: "arrow.up.arrow.down.circle.fill")
                                            .font(.title)
                                            .foregroundColor(Color.trenitaliaRed)
                                            .padding(5)
                                    }
                                    VStack(spacing: 20) {
                                        TextField("Departure Station", text: $depStation){
                                            UIApplication.shared.endEditing()
                                            if isEditingDep {
                                                isEditingDep.toggle()
                                            }
                                        }
                                        .overlay{
                                            if isEditingDep {
                                                HStack {
                                                    Spacer()
                                                    Button(action: {
                                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                        if depStation.isEmpty {
                                                            isEditingDep.toggle()
                                                            depStation = ""
                                                        }
                                                    }) {
                                                        Image(systemName: "xmark.circle.fill")
                                                            .foregroundColor(.secondary)
                                                    }
                                                    .padding(.trailing)
                                                    .onSubmit {
                                                        if isEditingDep {
                                                            isEditingDep.toggle()
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        .onTapGesture {
                                            if isEditingArr {
                                                isEditingArr.toggle()
                                            }
                                            if !isEditingDep {
                                                isEditingDep.toggle()
                                            }
                                        }
                                        
                                        TextField("Arrival Station", text: $arrStation){
                                            UIApplication.shared.endEditing()
                                            if isEditingArr {
                                                isEditingArr.toggle()
                                            }
                                        }
                                        .overlay {
                                            if isEditingArr {
                                                HStack {
                                                    Spacer()
                                                    Button(action: {
                                                        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                                                        if arrStation.isEmpty {
                                                            isEditingArr.toggle()
                                                            arrStation = ""
                                                        }
                                                        
                                                    }) {
                                                        Image(systemName: "xmark.circle.fill")
                                                            .foregroundColor(.secondary)
                                                    }
                                                    .padding(.trailing)
                                                    .onSubmit {
                                                        if isEditingArr {
                                                            isEditingArr.toggle()
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                        .onTapGesture {
                                            if isEditingDep {
                                                isEditingDep.toggle()
                                            }
                                            if !isEditingArr {
                                                isEditingArr.toggle()
                                            }
                                        }
                                        
                                    }
                                }
                                VStack(alignment: .leading, spacing: 15) {
                                    Text("Recents")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Button(action: {
                                        depStation = "Napoli Campi Flegrei"
                                        arrStation = "Napoli San Giovanni Barra"
                                    }) {
                                        Text("\(Image(systemName: "timer")) Napoli Campi Flegrei - Napoli San Giovanni Barra")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.trenitaliaRed)
                                    }
                                    Button(action: {
                                        depStation = "Roma Termini"
                                        arrStation = "Napoli Centrale"
                                    }) {
                                        Text("\(Image(systemName: "timer")) Roma Termini - Napoli Centrale")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.trenitaliaRed)
                                    }
                                    Button(action: {
                                        depStation = "Napoli Centrale"
                                        arrStation = "Roma Termini"
                                    }) {
                                        Text("\(Image(systemName: "timer")) Napoli Centrale - Roma Termini")
                                            .font(.subheadline)
                                            .fontWeight(.regular)
                                            .foregroundColor(Color.trenitaliaRed)
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading, spacing: 18) {
                                Picker("Choose your type of journey", selection: $selectedJourney) {
                                    ForEach(0..<journeyType.count) { index in
                                        Text(self.journeyType[index]).tag(index)
                                    }
                                }
                                .pickerStyle(.segmented)
                                .onChange(of: selectedJourney) { height in
                                    if (selectedJourney == 0){
                                        rectangleHeight = 200
                                    } else if (selectedJourney == 1) {
                                        rectangleHeight = 280
                                    } else if (selectedJourney == 2) {
                                        rectangleHeight = 160
                                    }
                                }
                                
                                JourneyFiltersView(selectedJourney: $selectedJourney, rectangleHeight: $rectangleHeight, adultPassengerSelection: $adultPassengerSelection, childPassengerSelection: $childPassengerSelection, showPeopleSheet: $showPeopleSheet)
                                
                                if (selectedJourney == 0 || selectedJourney == 1){
                                    Toggle(isOn: $directTrains) {
                                        Text("Only direct trains")
                                            .font(.callout)
                                            .fontWeight(.semibold)
                                    }
                                    .padding()
                                    .tint(Color.trenitaliaRed)
                                }
                            }
                        }
                        Spacer()
                        Button(action: {
                            if (!depStation.isEmpty && !arrStation.isEmpty && adultPassengerSelection > 0) {
                                newTicket = TicketModel(id: UUID(), depStation: $depStation, arrStation: $arrStation, trainService: $journeyType[selectedJourney], trainNumber: $randomTrainNumber, ticketCode: $randomTicketCode)
                                tickets.append(newTicket)
                                presentationMode.wrappedValue.dismiss()
//                                self.showingNewTicketSheet.toggle()
                            }
                        }
                        ) {
                            Text("Buy Now")
                                .fontWeight(.bold)
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                        }
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        .background(Color.trenitaliaRed)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
//                }
//                .navigationBarColor(backgroundColor: .clear, tintColor: UIColor(Color.textColor))
                .navigationBarTitleDisplayMode(.inline)
                .navigationTitle("New Ticket")
//                .navigationBarItems(leading: Button("\(Image(systemName: "chevron.left"))Tickets") {
//                    presentationMode.wrappedValue.dismiss()
//                }
//                                        .foregroundColor(Color(UIColor.systemBlue))
//                )
                .padding()
                .onAppear{
                    UIDatePicker.appearance().tintColor = UIColor(Color.trenitaliaRed)
                }
                
                if showPeopleSheet {
                    BlurView(style: .regular)
                        .onTapGesture {
                            showPeopleSheet.toggle()
                        }
                    
                    VStack() {
                        Spacer()
                        PassengersView(adultPassengerSelection: $adultPassengerSelection, childPassengerSelection: $childPassengerSelection)
                            .edgesIgnoringSafeArea(.all)
                    }
                }
            }
        }
    }
}

