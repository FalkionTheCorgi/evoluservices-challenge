//
//  CellViewModel.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import Foundation

class CellViewModel: ObservableObject{
    
    
    func deleteItem(item: Item){
        
        let coreData = PersistenceController.shared
        
        coreData.deleteItem(item: item)
                
        
    }
    
}
