//
//  ContentView.swift
//  ModelPicker
//
//  Created by Eli Hartnett on 4/18/23.
//

import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    
    @State var isPlacementEnabled = false
    @State var selectedModel: Model?
    @State var modelConfirmedForPlacement: Model?
    @State var models: [Model] = []
    @State var doneLoading = false
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            
            ARViewContainer(modelConfirmedForPlacement: $modelConfirmedForPlacement).ignoresSafeArea()
            
            if isPlacementEnabled {
                PlacementButtonsView(isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel, modelConfirmedForPlacement: $modelConfirmedForPlacement)
            }
            else {
                ModelViewPicker(models: models, isPlacementEnabled: $isPlacementEnabled, selectedModel: $selectedModel)
            }
        }
        .onAppear {
            models = getModels()
        }
    }
    
    func getModels() -> [Model] {
        let fileManager = FileManager.default
        guard let path = Bundle.main.resourcePath, let files = try? fileManager.contentsOfDirectory(atPath: path) else {
            return []
        }
        
        var availableModels: [Model] = []
        for file in files where file.hasSuffix("usdz") {
            let modelName = file.replacingOccurrences(of: ".usdz", with: "")
            let model = Model(modelName: modelName)
            availableModels.append(model)
        }
        return availableModels
    }
}

#if DEBUG
struct ContentView_Previews : PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
