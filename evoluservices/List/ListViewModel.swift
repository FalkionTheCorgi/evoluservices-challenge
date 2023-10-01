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
    
    func getTasks() {
        
        let coreData = PersistenceController.shared

        cancellable = coreData.dataChangedPublisher
            .sink(receiveValue: { [weak self] _ in
                self?.atualizarLista()
            })

        
    }
    
    private func atualizarLista() {
        // Obtenha os dados do banco de dados
        let itemsFromDatabase = PersistenceController.shared.getAllItems()
        

        self.items = itemsFromDatabase
        

        
    }

    
}
