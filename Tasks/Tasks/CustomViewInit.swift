//
//  CustomViewInit.swift
//  Tasks
//
//  Created by siddhatech on 02/08/24.
//

import SwiftUI

struct CustomViewInit: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    CustomViewInit()
}


struct CustomViewWithoutInit : View {
    var image : String
    var text  : String
    
    var body: some View {
        HStack{
            Image(image)
        }
    }
}
