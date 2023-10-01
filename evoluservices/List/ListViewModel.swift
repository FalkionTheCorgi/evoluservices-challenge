//
//  ListViewModel.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import Foundation
import Combine

class ListViewModel: ObservableObject{
    

    @Published var items: [Item] = []
    private var cancellable: AnyCancellable?
    
    
    init() {
        
        getTasks()
        atualizarLista()
        
    }
    
    //método que observa a atualização do banco de dados local
    func getTasks() {
        
        let coreData = PersistenceController.shared

        cancellable = coreData.dataChangedPublisher
            .sink(receiveValue: { [weak self] _ in
                self?.atualizarLista()
            })

        
    }
    
    //método para atualizar a published com a lista de items
    private func atualizarLista() {
       
        let itemsFromDatabase = PersistenceController.shared.getAllItems()
        

        self.items = itemsFromDatabase
        

        
    }

    
}
