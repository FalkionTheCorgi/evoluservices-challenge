//
//  ListView.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var model : ListViewModel = ListViewModel()
    @State var isPresenting = false
    
    
    var body: some View {
        
        NavigationStack{
            
            ZStack{
                
                if $model.items.count != 0 {
                    
                    ScrollView{
                        
                        LazyVStack {
                            ForEach(model.items, id: \.self){ item in
                                NavigationLink(destination: DetailsView(title: item.title ?? "", description: item.descript ?? "", date: item.date ?? "")){
                                    CellView(item: item)
                                        .transition(.scale)
                                }
                                
                            }
                            Divider()
                        }
                        .id(UUID())
                        .listRowSeparator(.visible)
                        .padding(32)
                        
                    }
                } else {
                    GeometryReader{ proxy in
                        
                        let width = proxy.size.width
                        let height = proxy.size.height
                        
                        VStack{
                            
                            Text("There's no Task")
                                .frame(width: width, height: height, alignment: .center)
                            
                        }
                    }
                    
                }
            }
            .navigationTitle("Evoluservice")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarRole(.editor)
            .toolbar{
                Button {
                    isPresenting = true
                } label: {
                    Image(systemName: "plus")
                    
                }.sheet(isPresented: $isPresenting, content: {
                    AddOrEditItem(isEdit: false, dismiss: {isPresenting = false})
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.hidden)
                })
            }
            .toolbarBackground(
                Color("AccentColor"),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        .tint(Color("TitleColor"))
            
            
        
    }
}

#Preview {
    ListView()
}
