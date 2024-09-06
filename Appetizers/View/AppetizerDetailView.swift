//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by sanwar on 03/08/24.
//

import SwiftUI

struct AppetizerDetailView: View {
    let appetizer:Appetizer
   @Binding var isShowingDetailView:Bool
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack{
                ImageLoaderRemote(imageUrlString: appetizer.imageURL)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300)
                VStack{
                    Text(appetizer.name)
                        .font(.title2)
                    Text(appetizer.description)
                        .multilineTextAlignment(.center)
                        .padding()
                        .font(.subheadline)
                    
                    Spacer()
                    HStack(spacing: 35){
                        NutritionInfo(title: "Calories", value: appetizer.calories)
                        NutritionInfo(title: "Carbs", value: appetizer.carbs)
                        NutritionInfo(title: "Protein", value: appetizer.protein)
                        
                    }.padding(.bottom,30)
                }
                
                Button {
                    print("action called")
                } label: {
                    ApButton(title: "₹\(String(format: "%.2f", appetizer.price)) Add To Order")                }.padding(.bottom, 20)
                
            }
            .frame(width: 295,height: 525)
            .background()
            .cornerRadius(12)
            .shadow(radius: 40)
            
            Button {
                isShowingDetailView=false
            } label: {
                XDismissButton().padding()

            }

            
        }
    }
}

struct AppetizerDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetailView: .constant(true))
    }
}

struct NutritionInfo:View{
    let title:String
    let value:Int
    var body: some View{
        VStack(spacing: 5){
            Text(title)
                .font(.footnote)
            Text("\(value)")
                .font(.footnote)
                .foregroundColor(.secondary)
                .italic()
        }
    }
}
