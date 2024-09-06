//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by sanwar on 02/08/24.
//

import SwiftUI

class AppetizerListViewModel:ObservableObject{
    @Published var appetizers:[Appetizer]=[]
    @Published var networkAlert:AlertItem?
    @Published var isLoading:Bool=true
    @Published var isShowingDetailView = false
    @Published var selectedAppetizer:Appetizer?
    
    func getAppetizers(){
        NetworkManager.networkManagerInstance.getAppetizers { result in
            DispatchQueue.main.async { [self] in
                isLoading=false
                switch result{
                case .success(let Appetizers):
                    self.appetizers=Appetizers
                case .failure(let error):
                    switch error{
                    case .invalidData:
                        networkAlert=AlertContext.invalidData
                    case .invalidURL:
                        networkAlert=AlertContext.invalidURL
                    case .invalidResponse:
                        networkAlert=AlertContext.invalidResponse
                    case .unableToComplete:
                        networkAlert=AlertContext.unableToComplete
                    }
                }
            }
        }
    }
    

}
