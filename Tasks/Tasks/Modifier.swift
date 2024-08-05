//
//  Modifier.swift
//  Tasks
//
//  Created by siddhatech on 31/07/24.
//

import SwiftUI

struct ModifierExample:View {
    var color1 = Color.yellow
   @State private var isActive: Bool = false
    var body: some View {
        Text("Hello Bhushan")
            .viewModifierUI(color: color1,active: isActive)
        Button(action:{
            isActive.toggle()
        }, label: {
            Text("For Example 1")
        }).viewModifierUI(color: color1,active: isActive)
    }
}

struct ViewModifierUI: ViewModifier{
    var color : Color
    var isActive : Bool
    func body(content : Content)-> some View{
       content
            .font(.title2)
            .padding()
            .background( isActive ? .gray :.blue)
            .cornerRadius(20)
            .foregroundColor(color)
            .padding()
         }
}


extension View {
    func viewModifierUI (color : Color ,active :Bool) -> some View{
        modifier(ViewModifierUI(color: color,isActive: active))
    }
}

#Preview {
    ModifierExample()
}
