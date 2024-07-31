//
//  ImageCaptureView.swift
//  ScanGrater
//
//  Created by Pablo on 29/6/24.
//

import SwiftUI
import PhotosUI

struct ImageCaptureView: View {
    @State private var examItem: PhotosPickerItem?
    @State private var templateItem: PhotosPickerItem?
    @State private var selectedExam: Image?
    @State private var selectedTemplate: Image?
    
    var body: some View {
        VStack(spacing: 20) {
            PhotosPicker("Select an exam", selection: $examItem, matching: .images)
            
            selectedExam?
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            PhotosPicker("Select a template", selection: $templateItem, matching: .images)
            
            selectedTemplate?
                .resizable()
                .scaledToFit()
                .padding(.horizontal)
            
            Button(action : {
                print("Comparing...")
            }, label: {
                Text("Compare images")
            })
            
        }
        .onChange(of: examItem) {
            Task {
                selectedExam = try await examItem?.loadTransferable(type: Image.self)
            }
        }
        .onChange(of: templateItem) {
            Task {
                selectedTemplate = try await templateItem?.loadTransferable(type: Image.self)
            }
        }
    }
}

struct ImageCaptureView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCaptureView()
    }
}
