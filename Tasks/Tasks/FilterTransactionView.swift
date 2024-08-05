//
//  FilterTransactionView.swift
//  Tasks
//
//  Created by siddhatech on 01/08/24.
//

import SwiftUI

struct FilterTransactionView: View {
    @State private var isCheck : Bool = false
    @State private var selectedItem : Set<String> = []
    var List1 = ["Entre mis cuentas","Cobros con código QR","Transferencias recibidas"]
    var List2 = ["Entre mis cuentas ","Pagos con código QR","Pagos de servicio","Transferencias realizadas"]
    var body: some View {
        VStack{
            HeaderView()
            DateSelectorMainView()
            ScrollView{
                VStack(alignment: .leading){
                    Text("Tipo de transacción")
                        .font(.system(size: 21  , weight: .bold))
                        .foregroundColor(.textC1)
                    
                    CustomLableView1(text: "Entradas", image: "transaction_i", fsize: 20, colorT: .filterC, weight: .bold).padding()
                   
                    ForEach(List1 ,id: \.self){ list in
                        CheckListView(selectedItem: $selectedItem, text: list)
                    }
                   
                    CustomLableView1(text: "Salidas", image: "Union", fsize: 20,colorT: .filterC, weight: .bold).padding()
                    ForEach(List2 ,id: \.self){ list in
                        CheckListView(selectedItem: $selectedItem, text: list)
                    }
                }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
            HStack(spacing:12){
                Button(action:{
                    selectedItem.removeAll()
                }){
                    CustomButtonView(text: "Limpiar filtros",backgroundc: .buttonc,foregroundC: .filterC)
                }.padding(.bottom)
            
                Button(action:{
                    
                }){
                    CustomButtonView(text: "Aplicar filtros",backgroundc: .darkTurquoise ,foregroundC: .white)
                }
                .padding(.bottom)
            }
        }
    }
}

struct HeaderView : View {
    var body: some View {
        HStack {
               Image("Back_i")
                .offset(y:-6)
                   Spacer()
                   
            VStack{
                Text("Filtrar transacciones")
                    .font(.body)
                    .foregroundColor(.gray)
                Divider().frame(width: 70)
                    .offset(y:20)
            }
                   Spacer()
               }
               .padding()
             
    }
}
struct CustomLableView: View {
    var text : String
    var fsize : CGFloat
   
    var colorT : Color
    var weight : Font.Weight
    var isCheck : Bool
    var body: some View {
        HStack(spacing: 6){
            Image(isCheck ?"uncheckbox" :"checkbox")
                
            Text(text)
                .font(.system(size: fsize,weight: weight))
                .foregroundColor(colorT)
        }
    }
}
struct CustomLableView1: View {
    var text : String
    var image : String
    var fsize : CGFloat
    var colorT : Color
    var weight : Font.Weight
    var body: some View {
        HStack(spacing: 8){
            Image(image)
                .padding(.trailing,2)
            Text(text)
                .font(.system(size: fsize,weight: weight))
                .foregroundColor(colorT)
        }
    }
}
struct CheckListView : View {
    @Binding var selectedItem : Set<String>
    var text : String
    var body: some View {
        Button(action: {
            if(selectedItem.contains(text)){
                selectedItem.remove(text)
            }else{
                selectedItem.insert(text)
            }
        }){
            CustomLableView(text: text, fsize: 16,colorT: .filterC, weight: .regular, isCheck: selectedItem.contains(text)).padding(.leading)
            
        }
    }
}

struct CustomButtonView : View {
    var text : String
    var backgroundc  : Color
    var foregroundC  : Color
    var body: some View {
            Text(text)
            .foregroundColor(foregroundC)
            .font(.system(size : 21,weight: .medium))
           .frame(width: 130,height:50)
           .padding(.vertical ,5)
          .padding(.horizontal ,20)
          .background(backgroundc)
          .cornerRadius(10)
    }
}

struct CustomLableViewWithInit: View {
    var text : String
    var fsize : CGFloat
   
    var colorT : Color
    var weight : Font.Weight
    var isCheck : Bool
    
    init(text: String, fsize: CGFloat, colorT: Color, weight: Font.Weight, isCheck: Bool) {
        self.text = text
        self.fsize = fsize
        self.colorT = colorT
        self.weight = weight
        self.isCheck = isCheck
    }
    var body: some View {
        HStack(spacing: 6){
            Image(isCheck ?"uncheckbox" :"checkbox")
                
            Text(text)
                .font(.system(size: fsize,weight: weight))
                .foregroundColor(colorT)
        }
    }
}

#Preview {
FilterTransactionView()
}
