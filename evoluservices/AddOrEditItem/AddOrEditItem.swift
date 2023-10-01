//
//  AddOrEditItem.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import SwiftUI

struct AddOrEditItem: View {
    
    @StateObject var model : AddOrEditItemViewModel = AddOrEditItemViewModel()
    var id : String = ""
    @State var title: String = ""
    @State var description: String = ""
    @State var verifyField = false
    var isEdit: Bool = false
    var dismiss: () -> Void
    
    var body: some View {
        GeometryReader{ proxy in
            let width = proxy.size.width
            
            VStack(spacing: 16){

                Text(isEdit ? "EDITAR ITEM" : "ADICIONAR ITEM")
                   .font(.title) // Define a fonte do título título
                   .bold() // Deixa o texto em negrito
                   .padding()
                
                TextField("Título", text: $title)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .overlay{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(verifyField ? title.isEmpty ? Color.red : Color.gray : Color.gray, lineWidth: 1)
                    }
                
                TextField("Descrição", text: $description)
                    .padding()
                    .multilineTextAlignment(.leading)
                    .overlay{
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(verifyField ? description.isEmpty ? Color.red : Color.gray : Color.gray, lineWidth: 1)
                    }
                
                Spacer()

                ProgressButton(title: $model.buttonTitle, progress: $model.isProgress, color: Color("AccentColor"),
                width: width){
                    if(title.isEmpty || description.isEmpty){
                        verifyField.toggle()
                    } else {
                        if isEdit {
                            model.editData(id: id, title: title, description: description)
                            dismiss()
                        } else {
                            
                            model.saveData(title: title, description: description)
                            dismiss()
                            
                        }
                    }
                }
                
                ProgressButton(title: .constant("FECHAR"), progress: .constant(false), color: Color("TitleColor"),
                width: width){
                    dismiss()
                }
                
            }
            
        }
        .padding(16)
        .onAppear{
            DispatchQueue.main.async{
                model.buttonTitle = isEdit ? "EDITAR" : "ADICIONAR"
            }
        }
            
    }
}

#Preview {
    AddOrEditItem(dismiss: {})
}
