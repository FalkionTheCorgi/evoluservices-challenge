//
//  ProgressButton.swift
//  evoluservices
//
//  Created by Manollo on 29/09/23.
//

import SwiftUI

struct ProgressButton: View {
    
    @Binding var title: String
    @Binding var progress: Bool
    var color: Color = Color.blue
    var width = UIScreen.main.bounds.width
    var onClick: () -> Void
    
    var body: some View {
        Button(action: {
            onClick()// Ação a ser executada quando o botão for pressionado
        }) {
            HStack(spacing: 4){
                if progress{
                    ProgressView()
                        .tint(.white)
                }
                Text(title)
                    .padding()
            }
            .foregroundColor(.white)
            .frame(width: width)
            .background(color)
            .cornerRadius(10)
        }
    }
}

#Preview {
    ProgressButton(title: .constant("BUTTON"), progress: .constant(true)){}
}
