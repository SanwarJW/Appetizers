//
//  ImageLoader.swift
//  Appetizers
//
//  Created by sanwar on 02/08/24.
//

import Foundation
import SwiftUI



struct ImageLoaderRemote:View{
    @StateObject var imageLoader=ImageLoader()
    let imageUrlString:String
    
    var body: some View{
        ImageView(image: imageLoader.image)
            .onAppear{
                imageLoader.load(urlString: imageUrlString)
            }
    }
    
}

struct ImageView:View{
    var image:Image?
    var body: some View{
        image?.resizable() ?? Image("food-placeholder").resizable()
    }
}


final class ImageLoader:ObservableObject{
    @Published var image:Image?=nil
    
    func load(urlString:String){
        NetworkManager.networkManagerInstance.downloadImage(imageUrlString: urlString) { UIImage in
            guard let UIImage=UIImage else{
                return
            }
            DispatchQueue.main.async {
                self.image = Image(uiImage: UIImage)
            }
        }
    }
}
