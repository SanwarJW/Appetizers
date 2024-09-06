//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by sanwar on 30/07/24.
//

import SwiftUI

struct AppetizerListView: View {
    @StateObject var viewModel=AppetizerListViewModel()
    
   
    
    var body: some View {
       
        ZStack{
            NavigationView{
                List(viewModel.appetizers,id: \.id) { Appetizer in
                    
                    AppetizersListCell(appetizer: Appetizer)
                        .onTapGesture {
                            viewModel.selectedAppetizer=Appetizer
                            viewModel.isShowingDetailView=true
                        }
                    
                }.navigationTitle(" 🍔 Appetizer's")
            }.alert(item: $viewModel.networkAlert) { alertItem in
                Alert(title: alertItem.title,
                      message: alertItem.message,
                      dismissButton: alertItem.dismissButton)
            }.onAppear{
                viewModel.getAppetizers()
            }
            .blur(radius: viewModel.isShowingDetailView ? 20:0)
            .scrollDisabled(viewModel.isShowingDetailView)
            
            if viewModel.isShowingDetailView{
                AppetizerDetailView(appetizer: viewModel.selectedAppetizer!, isShowingDetailView: $viewModel.isShowingDetailView )
            }
            if viewModel.isLoading{
                LoadingView()
            }
            
        }
    }
}


struct AppetizerListView_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerListView()
    }
}

