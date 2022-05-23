//
//  ContentView.swift
//  Shared
//
//  Created by Giuseppe Falso on 10/12/21.
//

import SwiftUI

struct ContentView: View {
    @State var tickets = [TicketModel]()
    @StateObject var ticketsContainer = TicketContainer()
    @State private var showingNewTicketSheet = false
    @State private var subscriptionsIsEmpty = true
    @State private var tabSelection = "Tickets"
    
    init() {
        UITabBar.appearance().tintColor = UIColor(Color.trenitaliaRed)
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { geometry in
                TabView(selection: $tabSelection) {
                    Text("Currently Developing")
                        .tabItem {
                            Label("Promotions", systemImage: "bag.fill")
                        }
                        .tag("Promotions")
                    VStack(alignment: .leading) {
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Your tickets")
                                .font(.title)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .padding()
                            
                            if (tickets.isEmpty) {
                                EmptyTicketView()
                            } else {
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack(spacing: 15) {
                                        ForEach((0..<(tickets.count)).reversed(), id: \.self) { ticket in
                                            tickets[ticket]
                                        }
                                    }
                                }.padding(.leading)
                            }
                        }
                        Spacer()
                        VStack(alignment: .leading, spacing: 0) {
                            Text("Subscriptions")
                                .font(.title)
                                .fontWeight(.semibold)
                                .multilineTextAlignment(.leading)
                                .padding()
                            
                            if subscriptionsIsEmpty{
                                HStack(spacing: 15) {
                                    EmptyTicketView()
                                }
                                .frame(maxWidth: .infinity)
                            } else {
                                ScrollView(.horizontal, showsIndicators: false){
                                    HStack(spacing: 15) {
                                        EmptyTicketView()
                                    }
                                    .padding(.leading)
                                }
                            }
                            
                        }
                        Spacer()
                    }
                    .tabItem {
                        Label("Tickets", systemImage: "ticket.fill")
                    }
                    .tag("Tickets")
                    Text("Currently Developing")
                        .tabItem {
                            Label("Timetable", systemImage: "tram.fill")
                        }
                        .tag("Timetable")
                    Text("Currently Developing")
                        .tabItem {
                            Label("Account", systemImage: "person.fill")
                        }
                        .tag("Account")
                }
                .accentColor(.trenitaliaRed)
            }
            .environmentObject(ticketsContainer)
            .navigationBarColor(backgroundColor: UIColor(Color.trenitaliaRed), tintColor: .white)
            .navigationBarTitle("\(tabSelection)")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    if tabSelection == "Tickets" {
                        NavigationLink(destination: NewTicketView(showingNewTicketSheet: $showingNewTicketSheet, tickets: $tickets)) {
                            Image(systemName: "plus.circle.fill")
                                .font(.title)
                                .foregroundColor(.white)
//                                .onTapGesture {
//                                    showingNewTicketSheet.toggle()
//                                }.sheet(isPresented: $showingNewTicketSheet) {
//                                    NewTicketView(showingNewTicketSheet: $showingNewTicketSheet, tickets: $tickets)
//                                }
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
