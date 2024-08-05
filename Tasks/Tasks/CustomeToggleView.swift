//
//  CustomeToggleView.swift
//  Tasks
//
//  Created by siddhatech on 05/08/24.
//

import SwiftUI

struct CustomeToggleView: View {
    @State var isOn: Bool = false
          // -------------- New in Step 2
          private var circleOffset: CGFloat {
              isOn ? 11 : -11
          }
    var body: some View {
        RoundedRectangle(cornerRadius: 50)
            .foregroundColor(isOn ? .orange : .accentColor)
            .frame(width: 51,
                   height: 31)
            .overlay(
                Circle()
                    .frame(width: 25,
                           height: 25)
                    .foregroundColor(.white)
                    .padding(3)
                    .overlay(
                        Image(systemName: isOn ? "checkmark" : "xmark")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .font(.title.weight(.bold))
                            .frame(width: 10,
                                   height: 10)
                            .foregroundColor(isOn ? .orange : .accentColor)
                    )
                    .offset(x: circleOffset)
            )
            // -------------- New in Step 4
            .animation(.linear(duration: 0.15), value: isOn)
            .onTapGesture { isOn.toggle() }

    }
}

#Preview {
//    CustomeToggleView()
    SettingsView()
}



 struct SettingsView: View {
     var body: some View {
         NavigationView {
             List {
                 Section(header: Text("GENERAL")) {
                     NavigationLink(destination: Text("Do Not Disturb")) {
                         HStack {
                             Image(systemName: "moon")
                             Text("Do Not Disturb")
                         }
                     }
                     NavigationLink(destination: Text("Display & Brightness")) {
                         HStack {
                             Image(systemName: "textformat.size")
                             Text("Display & Brightness")
                         }
                     }
                     NavigationLink(destination: Text("Sounds & Haptics")) {
                         HStack {
                             Image(systemName: "speaker.2")
                             Text("Sounds & Haptics")
                         }
                     }
                     NavigationLink(destination: Text("Screen Time")) {
                         HStack {
                             Image(systemName: "hourglass")
                             Text("Screen Time")
                         }
                     }
                 }
                 Section(header: Text("ACCOUNTS")) {
                     NavigationLink(destination: Text("iCloud")) {
                         HStack {
                             Image(systemName: "icloud")
                             Text("iCloud")
                         }
                     }
                     NavigationLink(destination: Text("Password & Security")) {
                         HStack {
                             Image(systemName: "lock")
                             Text("Password & Security")
                         }
                     }
                 }
                 Section(header: Text("ABOUT")) {
                     NavigationLink(destination: Text("General")) {
                         HStack {
                             Image(systemName: "info.circle")
                             Text("General")
                         }
                     }
                     NavigationLink(destination: Text("Software Update")) {
                         HStack {
                             Image(systemName: "arrow.up.right.circle")
                             Text("Software Update")
                         }
                     }
                 }
             }
             .listStyle(GroupedListStyle())
             .navigationTitle("Settings")
         }
     }
 }

