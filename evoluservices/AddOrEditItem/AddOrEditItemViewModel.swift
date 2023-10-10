//
//  AddOrEditItemViewModel.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import Foundation

class AddOrEditItemViewModel: ObservableObject{
    
    @Published var buttonTitle = "ADICIONAR"
    @Published var isProgress = false
    
    //método para extrair data e hora local e devolver como string
    func getDate() -> String{
        
        let now = Date() // Obtém a data e hora atuais

        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy HH:mm:ss" // Define o formato de data e hora desejado
        dateFormatter.locale = Locale.current // Define a localização atual para obter a hora local

        let dateHour = dateFormatter.string(from: now) // Converte a data em uma string formatada

        return dateHour
        
    }
    
    func saveData(title: String, description: String) {
        
        DispatchQueue.main.async{
            self.isProgress = true
            self.buttonTitle = "CARREGANDO"
        }
        
        let coreData = PersistenceController.shared
        
        coreData.saveItem(title: title, description: description, date: getDate())
        
        DispatchQueue.main.async{
            self.isProgress = false
            self.buttonTitle = "ADICIONAR"

        }

        
        
    }
    
    func editData(id: String, title: String, description: String) {

        DispatchQueue.main.async{
            self.isProgress = true
            self.buttonTitle = "CARREGANDO"
        }
        
        let coreData = PersistenceController.shared
        
        coreData.updateItem(id: id, title: title, description: description)
        
        DispatchQueue.main.async{
            self.isProgress = true
            self.buttonTitle = "EDITAR"
        }
        
    }
    
}
