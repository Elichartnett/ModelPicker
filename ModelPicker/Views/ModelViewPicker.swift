//
//  ModelViewPicker.swift
//  ModelPicker
//
//  Created by Eli Hartnett on 4/18/23.
//

import SwiftUI

struct ModelViewPicker: View {
    
    let models: [Model]
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            
            HStack {
                
                ForEach(models) { model in
                    
                    model.image
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100, height: 100)
                        .cornerRadius(20)
                        .shadow(radius: 5)
                        .padding()
                        .onTapGesture {
                            selectedModel = model
                            isPlacementEnabled = true
                        }
                }
            }
        }
        .background(.gray.opacity(0.25))
        .background(.thinMaterial)
    }
}

struct ModelViewPicker_Previews: PreviewProvider {
    static var previews: some View {
        ModelViewPicker(models: [], isPlacementEnabled: .constant(false), selectedModel: .constant(nil))
    }
}
