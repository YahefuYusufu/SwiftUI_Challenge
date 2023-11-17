//
//  ContentView.swift
//  DatePlannerV2
//
//  Created by yusufyakuf on 2023-11-15.
//

import SwiftUI

struct EventList: View {
   @EnvironmentObject var eventData: EventData
   @State private var isAddingNewEvent = false
   @State private var newEvent = Event()
   
   var body: some View {
      List {
         ForEach(Period.allCases) { period in
            if !eventData.sortedEvents(period: period).isEmpty {
               Section(content: {
                  ForEach(eventData.sortedEvents(period: period)) { $event in
                     NavigationLink {
                        EventEditor(event: $event)
                     } label: {
                        EventRow(event: event)
                     }
                     .swipeActions {
                        Button(role: .destructive) {
                           eventData.delete(event)
                        } label: {
                           Label("Delete", systemImage: "trash")
                        }
                     }
                  }
                  
               })
            }
         }
      }
      .navigationTitle("Event Planner")
      .toolbar {
         ToolbarItem {
            Button {
               newEvent = Event()
               isAddingNewEvent = true
            } label: {
               Image(systemName:"plus")
            }
         }
      }
      .sheet(isPresented: $isAddingNewEvent) {
         NavigationView {
            EventEditor(event: $newEvent, isNew: true)
           }
         }
      }
   }

#Preview {
   NavigationView {
      EventList().environmentObject(EventData())
   }
}
