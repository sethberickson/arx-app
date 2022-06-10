//
//  CodeTextField.swift
//  arx-app
//
//  Created by Seth Erickson on 6/9/22.
//

import SwiftUI

struct CodeTextField: View {
    
    @State var text: String = ""
    
    var body: some View {
        TextField(
            "Enter Code",
            text: $text
        )
        .foregroundColor(ColorConstants.arxNavy)
        .background(ColorConstants.white)
        .textInputAutocapitalization(.never)
        .disableAutocorrection(true)
        .border(.secondary)
        .keyboardType(.decimalPad)
    }
}

struct CodeTextField_Previews: PreviewProvider {
    static var previews: some View {
        CodeTextField()
    }
}
