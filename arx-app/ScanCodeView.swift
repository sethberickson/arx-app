//
//  SelectStoryView.swift
//  arx-app
//
//  Created by Seth Erickson on 6/8/22.
//

import SwiftUI
import CodeScanner

struct ScanCodeView: View {
    
    @State var showScanner: Bool = false
    @State var showTextField: Bool = false
    @State var scannedCode: String = "Scan a QR code to get started"
    @State var code: String = ""

    var body: some View {
        VStack {
            Button {
                showScanner = true
            } label: {
                Text("Scan QR Code")
            }
            
            Button {
                showTextField = true
                addAnimation()
            } label: {
                Text("Enter Code")
            
            if showTextField {
                TextField(
                    "Enter Code",
                    text: $code
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                }
            }
        }
        .sheet(isPresented: $showScanner) {
            CodeScannerView(codeTypes: [.qr], completion: handleScan(result:))
        }
    }
    
    func handleScan(result: Result<ScanResult, ScanError>) {
        showScanner = false
        
        switch result {
        case .success(let result):
            let details = result.string
            guard details.count == 1 else { return }
            
            // TODO: Once the story object exists, use this story ID
//            let story = Story()
//            story.id = details[0]
        
        case .failure(let error):
            print("Scanning failed: \(error.localizedDescription)")
        }
    }
        
    func addAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            withAnimation(
                Animation
                    .spring()
            ) {

            }
        }
    }
}

struct QRCodeScannerView_Previews: PreviewProvider {
    static var previews: some View {
        ScanCodeView(code: "111111")
    }
}


