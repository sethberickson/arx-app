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
        HStack {
            ZStack {
                Image("ARRO_right")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: UIScreen.main.bounds.size.width * 0.4, alignment: .center)
                CustomText(text: "Hey there! Scan a game code to get started.", size: UIDevice.current.userInterfaceIdiom == .pad ? 36 : 24 ) // adjust text size based on device
                     .font(.system(size: 36))
                     .foregroundColor(ColorConstants.arxNavy) // text color
                     .padding()
                     .background(RoundedRectangle(cornerRadius: 15)
                         .foregroundColor(ColorConstants.blue1)) // background shape color
                     .frame(maxWidth: UIScreen.main.bounds.size.width * 0.25)
                     .transition( AnyTransition.move(edge: .leading).combined(with: AnyTransition.opacity).combined(with: .scale))
                     .padding()
                     .offset(x: 220, y: -250)
//                     .tapTo(readText: step.text, offset: 20)
            }
                
            Spacer()
            VStack {
                Spacer()
                LargeButton(text: "Scan QR Code") {
                    showScanner = true
                }
                Spacer()
                LargeButton(text: "Enter Code") {
                    showTextField.toggle()
                    addAnimation()
                }
                
                if showTextField {
                    HStack {
                        CodeTextField(text: code)
                        Image(systemName: "arrow.forward")
                            .padding(5)
                            .foregroundColor(ColorConstants.arxNavy)
                            .background(ColorConstants.white)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                                            }
                    .frame(width: 300, height: 50, alignment: .center)
                }
                Spacer()
            }
            .sheet(isPresented: $showScanner) {
                CodeScannerView(codeTypes: [.qr], completion: handleScan(result:))
            }
            Spacer() // HStack spacer
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
            .previewInterfaceOrientation(.landscapeLeft)
    }
}


