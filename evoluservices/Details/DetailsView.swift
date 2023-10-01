//
//  DetailsView.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import SwiftUI

struct DetailsView: View {
    
    var title: String
    var description: String
    var date: String
    
    var body: some View {
        
        ScrollView{
            
            VStack(spacing: 16){
                
                VStack(spacing: 32){
                    Text("Descrição do Item")
                       .font(.title) // Define a fonte do título título
                       .bold() // Deixa o texto em negrito
                       .foregroundStyle(Color("TitleColor"))
                       .padding()
                    
                    HStack{
                        Text("Título: ")
                            .foregroundStyle(Color("TitleColor"))
                            .bold()
                        +  Text(title.isEmpty ? "Empty" : title).foregroundStyle(Color("TitleColor"))
                        Spacer()
                    }
                    
                }
                
                HStack{
                    Text("Descrição: ")
                        .foregroundStyle(Color("TitleColor"))
                        .bold()
                    +  Text(description.isEmpty ? "Empty" : description).foregroundStyle(Color("TitleColor"))
                    Spacer()
                }
                
                HStack{
                    Text("Data: ")
                        .foregroundStyle(Color("TitleColor"))
                        .bold()
                    +  Text(date.isEmpty ? "Empty" : date).foregroundStyle(Color("TitleColor"))
                    Spacer()
                }
                
            }
            .padding(16)
            .toolbarBackground(
                Color("AccentColor"),
                for: .navigationBar
            )
            .toolbarBackground(.visible, for: .navigationBar)
            
        }
        
    }
}

#Preview {
    DetailsView(title: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa", description: "descricao", date: "data")
}
