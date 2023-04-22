//
//  Model.swift
//  ModelPicker
//
//  Created by Eli Hartnett on 4/18/23.
//

import Foundation
import Combine
import SwiftUI
import RealityKit

class Model: Identifiable {
    let name: String
    let image: Image
    var entity: ModelEntity?
    
    private var cancellable: AnyCancellable? = nil
    
    init(modelName: String) {
        self.name = modelName
        self.image = Image(modelName)
        
        let fileName = modelName + ".usdz"
        
        self.cancellable = ModelEntity.loadModelAsync(named: fileName).sink(receiveCompletion: { loadCompletion in
            print("Failed to load \(modelName)")
        }, receiveValue: { modelEntity in
            self.entity = modelEntity
        })
    }
}
