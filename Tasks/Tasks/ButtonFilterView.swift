//
//  ButtonFilterView.swift
//  Tasks
//
//  Created by siddhatech on 01/08/24.
//

import SwiftUI
struct filterButtonView: View {
    var body: some View {
            Button(action: {
                
            }){
                filterViewCustom(image: "Union", text: "filtros", foregroundColor: .filterC, backgroundColor: .buttonc ,cornerRadius: 28)
            }
        Button(action: {
            
        }){
            filterViewCustomInit(image: "Union", text: "filtros", foregroundColor: .filterC, backgroundColor: .buttonc , cornerRadius: 28)
        }
        
        Button(action: {
            
        }){
            filterViewCustom(image: "Filter_i", text: "filtros", foregroundColor: .filterC, backgroundColor: .buttonc ,cornerRadius: 28)
        }
        Button(action: {
            
        }){
            filterViewCustomInit(image: "Filter_i", text: "filtros", foregroundColor: .filterC, backgroundColor: .buttonc , cornerRadius: 28)
        }
    }
}

#Preview {
    filterButtonView()
}


struct filterViewCustom : View {
   let image : String
   let text  : String
   let foregroundColor : Color
   let backgroundColor :Color
    let cornerRadius  : CGFloat
   var body: some View {
            HStack(spacing:14){
                Image(image)
                    .foregroundColor(foregroundColor)
                    
                
                Text("Filtros")
                    .foregroundColor(foregroundColor)
                    .font(.system(size : 21,weight: .medium))
            }.frame(width: 104,height: 32)
                .padding(.vertical ,5)
                .padding(.horizontal ,20)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
       
    }
}


struct filterViewCustomInit : View {
   let image : String
   let text  : String
   let foregroundColor : Color
   let backgroundColor :Color
    let cornerRadius  : CGFloat
    init(image: String, text: String, foregroundColor: Color, backgroundColor: Color ,cornerRadius :CGFloat) {
        self.image = image
        self.text = text
        self.foregroundColor = foregroundColor
        self.backgroundColor = backgroundColor
        self.cornerRadius  =   cornerRadius
    }
   var body: some View {
            HStack(spacing:14){
                Image(image)
                    .foregroundColor(foregroundColor)
                   
                
                Text("Filtros")
                    .foregroundColor(foregroundColor)
                    .font(.system(size : 21,weight: .medium))
            }.frame(width: 104,height: 32)
                .padding(.vertical ,5)
                .padding(.horizontal ,20)
                .background(backgroundColor)
                .cornerRadius(cornerRadius)
       
    }
}
