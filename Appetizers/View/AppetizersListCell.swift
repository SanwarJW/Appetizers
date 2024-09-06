//
//  AppetizersListCell.swift
//  Appetizers
//
//  Created by sanwar on 31/07/24.
//

import SwiftUI

struct AppetizersListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack{
            ImageLoaderRemote(imageUrlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit).frame(width: 150,height:130)
                .cornerRadius(20)
            Spacer()
            VStack(alignment: .listRowSeparatorLeading,spacing: 10){
                Text(appetizer.name).font(.title2)
                
                Text("$\(appetizer.price,specifier: "%.2f")").font(.body).foregroundColor(.gray)

            }
            Spacer()
        }
    }
}

struct AppetizersListCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizersListCell(appetizer: MockData.sampleAppetizer)
    }
}
