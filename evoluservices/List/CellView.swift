//
//  CellView.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import SwiftUI

struct CellView: View {
    
    @State private var isPresenting: Bool = false
    @StateObject private var model : CellViewModel = CellViewModel()
    var item: Item
    
    var body: some View {
        ZStack{
            VStack{
                Divider()
                HStack{
                    Text(item.title ?? "")
                        .foregroundStyle(Color("TitleColor"))
                        .fontWeight(.bold)
                    Spacer()
                    HStack(spacing: 16){
                        Button {
                            isPresenting = true
                        } label: {
                            Image(systemName: "pencil")
                                .renderingMode(.template)
                                .foregroundColor(Color("TitleColor"))
                            
                        }.sheet(isPresented: $isPresenting, content: {
                            AddOrEditItem(id: item.id ?? "", title: item.title ?? "", description: item.descript ?? "", isEdit: true, dismiss: {
                                isPresenting = false
                            })
                                .presentationDetents([.medium])
                        })
                        Button {
                            withAnimation{
                                model.deleteItem(item: item)
                            }
                        } label: {
                            Image(systemName: "trash")
                                .renderingMode(.template)
                                .foregroundColor(Color("TitleColor"))
                            
                        }
                    }
                }
                .padding(4)
               
            }
        }
    }
}

#Preview {
    CellView(item: Item())
}
