//
//  ApButton.swift
//  Appetizers
//
//  Created by sanwar on 19/08/24.
//

import SwiftUI

struct ApButton: View {
    let title:String
    var body: some View {
      
            Text(title)
                .frame(width: 260,height: 45)
                .background(Color("brandPrimary"))
                .foregroundColor(Color(.white))
                .cornerRadius(10)
  
    }
}

struct ApButton_Previews: PreviewProvider {
    static var previews: some View {
        ApButton(title: "Add To Order")
    }
}
