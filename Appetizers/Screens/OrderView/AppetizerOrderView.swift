//
//  AppetizerOrderView.swift
//  Appetizers
//
//  Created by sanwar on 30/07/24.
//

import SwiftUI

struct AppetizerOrderView: View {
    var body: some View {
        NavigationView {
            VStack{
                List{
                    ForEach(MockData.appetizersList){appetizer in
                        AppetizersListCell(appetizer: appetizer)
                            .listStyle(PlainListStyle())
                    }
            }
                Button {
                    print("Button")
                } label: {
                    ApButton(title: "₹\(12) Place Order")
                        
                }.padding(.bottom,30)

            }
        .navigationTitle(Text("Order"))
        }
        
    }
}

struct AppetizerOrderView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerOrderView()
    }
}
