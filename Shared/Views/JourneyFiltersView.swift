//
//  JourneyFiltersView.swift
//  Trenitalia (iOS)
//
//  Created by Giuseppe Falso on 15/12/21.
//

import Foundation
import SwiftUI

struct JourneyFiltersView: View {
    @Binding var selectedJourney: Int
    @Binding var rectangleHeight: Int
    @Binding var adultPassengerSelection: Int
    @Binding var childPassengerSelection: Int
    @Binding var showPeopleSheet: Bool
    let solutions = ["All", "Regional Trains", "Frecciarossa", "AV", "InterCity"]
    let services = ["All", "1st Class/1st Business", "2nd Class/2nd Standard"]
    let durations = ["All", "Six Days", "Weekly", "Biweekly", "Monthly", "Quarterly", "Nine Months", "Annual"]
    @State private var solutionSelection = "All Solutions"
    @State private var serviceSelection = "All Services"
    @State private var durationSelection = "All Durations"
    
    var body: some View {
        VStack {
            if selectedJourney == 0 {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(height: CGFloat(rectangleHeight))
                        .shadow(color: Color(UIColor.systemGray4), radius: 5, x: 3, y: 2)
                        .overlay{
                            VStack(alignment: .leading, spacing: 20){
                                HStack {
                                    Text("Outward Date")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    
                                    DatePicker("", selection: .constant(Date()))
                                }
                                .padding(.top)
                                Divider()
                                
                                HStack {
                                    Text("Journey Type")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        Picker("Solutions", selection: $solutionSelection) {
                                            ForEach(0..<solutions.count) { index in
                                                Text("\(self.solutions[index])")
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        .accentColor(Color.trenitaliaRed)
                                        .labelsHidden()
                                    }
                                }
                                
                                Divider()
                                
                                HStack {
                                    Text("Passengers")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Button(action: {
                                                showPeopleSheet.toggle()
                                            })
                                            {
                                                HStack(alignment: .center) {
                                                    Image(systemName: "person.fill")
                                                        .font(.title)
                                                        .foregroundColor(Color.trenitaliaRed)
                                                    Text("\(adultPassengerSelection)")
                                                        .foregroundColor(Color.trenitaliaRed)
                                                    Image(systemName: "person.fill")
                                                        .foregroundColor(Color.trenitaliaRed)
                                                    Text("\(childPassengerSelection)")
                                                        .foregroundColor(Color.trenitaliaRed)
                                                }
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom)
                            }
                            .padding(.horizontal)
                        }
                }
            } else if selectedJourney == 1 {
                ZStack {
                    RoundedRectangle (cornerRadius: 10)
                        .foregroundColor(Color(UIColor.systemBackground))
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .frame(height: CGFloat(rectangleHeight))
                        .shadow(color: Color(UIColor.systemGray4), radius: 5, x: 3, y: 2)
                        .overlay{
                            VStack (alignment: .leading, spacing: 20) {
                                HStack {
                                    Text("Outward")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    
                                    DatePicker("", selection: .constant(Date()))
                                    
                                }
                                .padding(.top)
                                Divider()
                                
                                HStack {
                                    Text("Return")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    
                                    DatePicker("", selection: .constant(Date()))
                                    
                                }
                                Divider()
                                
                                HStack {
                                    Text("Journey Type")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    VStack(alignment: .trailing) {
                                        Picker("Solutions", selection: $solutionSelection) {
                                            ForEach(0..<solutions.count) { index in
                                                Text("\(self.solutions[index])")
                                            }
                                        }
                                        .pickerStyle(.menu)
                                        .accentColor(Color.trenitaliaRed)
                                        .labelsHidden()
                                    }
                                }
                                Divider()
                                
                                HStack {
                                    Text("Passengers")
                                        .font(.callout)
                                        .fontWeight(.semibold)
                                    Spacer()
                                    VStack {
                                        HStack {
                                            Button(action: {
                                                showPeopleSheet.toggle()
                                            })
                                            {
                                                HStack(alignment: .center) {
                                                    Image(systemName: "person.fill")
                                                        .font(.title)
                                                        .foregroundColor(Color.trenitaliaRed)
                                                    Text("\(adultPassengerSelection)")
                                                        .foregroundColor(Color.trenitaliaRed)
                                                    Image(systemName: "person.fill")
                                                        .foregroundColor(Color.trenitaliaRed)
                                                    Text("\(childPassengerSelection)")
                                                        .foregroundColor(Color.trenitaliaRed)
                                                }
                                                
                                            }
                                        }
                                    }
                                }
                                .padding(.bottom)
                            }
                            .padding(.horizontal)
                        }
                    
                }
            } else if selectedJourney == 2 {
                RoundedRectangle (cornerRadius: 10)
                    .foregroundColor(Color(UIColor.systemBackground))
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .frame(height: CGFloat(rectangleHeight))
                    .shadow(color: Color(UIColor.systemGray4), radius: 5, x: 3, y: 2)
                    .overlay {
                        VStack {
                            HStack {
                                Text("Train Type")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Picker("Train Type", selection: $solutionSelection) {
                                        ForEach(0..<solutions.count) { index in
                                            Text("\(self.solutions[index])")
                                        }
                                    }
                                    .pickerStyle(.menu)
                                    .accentColor(Color.trenitaliaRed)
                                    .labelsHidden()
                                }
                            }
                            .padding(.top)
                            Divider()
                            
                            HStack {
                                Text("Service")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Picker("Service", selection: $serviceSelection) {
                                        ForEach(0..<services.count) { index in
                                            Text("\(self.services[index])")
                                        }
                                    }
                                    .pickerStyle(.menu)
                                    .accentColor(Color.trenitaliaRed)
                                    .labelsHidden()
                                }
                            }
                            
                            Divider()
                            HStack {
                                Text("Duration")
                                    .font(.callout)
                                    .fontWeight(.semibold)
                                Spacer()
                                VStack(alignment: .trailing) {
                                    Picker("Durations", selection: $durationSelection) {
                                        ForEach(0..<durations.count) { index in
                                            Text("\(self.durations[index])")
                                        }
                                    }
                                    .pickerStyle(.menu)
                                    .accentColor(Color.trenitaliaRed)
                                    .labelsHidden()
                                }
                            }
                            .padding(.bottom)
                            
                        }
                        .padding(.horizontal)
                    }
            }
        }
    }
}

struct JourneyFilters_Preview: PreviewProvider {
    static var previews: some View {
        JourneyFiltersView(selectedJourney: .constant(0), rectangleHeight: .constant(200), adultPassengerSelection: .constant(0), childPassengerSelection: .constant(0),showPeopleSheet: .constant(false))
    }
}
