//
//  PlacementButtonsView.swift
//  ModelPicker
//
//  Created by Eli Hartnett on 4/18/23.
//

import SwiftUI

struct PlacementButtonsView: View {
    
    @Binding var isPlacementEnabled: Bool
    @Binding var selectedModel: Model?
    @Binding var modelConfirmedForPlacement: Model?
    
    var body: some View {
        
        HStack(spacing: 40) {
            
            Button {
                selectedModel = nil
                isPlacementEnabled = false
            } label: {
                Image(systemName: "xmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()
                    .background {
                        Circle()
                            .fill(.white.opacity(0.75))
                    }
            }
            
            Button {
                modelConfirmedForPlacement = selectedModel
                selectedModel = nil
                isPlacementEnabled = false
            } label: {
                Image(systemName: "checkmark")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
                    .padding()
                    .background {
                        Circle()
                            .fill(.white.opacity(0.75))
                    }
            }
        }
    }
}

struct PlacementButtonsView_Previews: PreviewProvider {
    static var previews: some View {
        PlacementButtonsView(isPlacementEnabled: .constant(false), selectedModel: .constant(nil), modelConfirmedForPlacement: .constant(nil))
    }
}
