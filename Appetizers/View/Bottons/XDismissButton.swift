//
//  XDismissButton.swift
//  Appetizers
//
//  Created by sanwar on 19/08/24.
//

import SwiftUI

struct XDismissButton: View {
    var body: some View {
        ZStack(){
            Circle().frame(width: 40)
                .foregroundColor(.white)
                .opacity(0.8)
            Image(systemName:"xmark")
                .imageScale(.large)
                .foregroundColor(.black)
        }
    }
}

struct XDismissButton_Previews: PreviewProvider {
    static var previews: some View {
        XDismissButton()
    }
}
