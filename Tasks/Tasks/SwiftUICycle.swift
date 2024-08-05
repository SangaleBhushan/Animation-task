//
//  SwiftUICycle.swift
//  Tasks
//
//  Created by siddhatech on 02/08/24.
//

import SwiftUI

struct ParentView: View {
    @State private var showChild = false

    var body: some View {
        VStack {
            Text("Parent View")
                .padding()

            Button("Toggle Child View") {
                showChild.toggle()
            }

            if showChild {
                ChildView()
            }
        }
        .onAppear {
            print("ParentView appeared")
        }
        .onDisappear {
            print("ParentView disappeared")
        }
    }
}

struct ChildView: View {
    @State private var message = "Child View"

    var body: some View {
        Text(message)
            .padding()
            .onAppear {
                print("ChildView appeared")
                // Simulate a delay before changing the message
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    self.message = "Updated Child View"
                }
            }
            .onDisappear {
                print("ChildView disappeared")
            }
    }
}
#Preview{
    ParentView()
}
