//
//  LugarModel.swift
//  Teste API
//
//  Created by Lucas Baggiotto on 20/06/23.
//

import Foundation

class LugarModel: ObservableObject{
    @Published var lugares: [Lugar] = []
    @Published var error: LugarError?
    
    @MainActor func getData() async{
        guard let url = URL(string: "https://gist.githubusercontent.com/LucasZBaggiotto/0ddfbe05495f9692f01e0ab1ec6d5c4f/raw/d46c71fb014cd26f44811a92dd55767d472af734/test.json")
        else{
            self.error = .invalidURL
            return
        }
        
        self.error = nil
        self.lugares = []
        
        do{
            
            let (data, response) = try await URLSession.shared.data(from: url)
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else{
                self.error = .invalidResponse
                print("ERROR invalid response", error)

                return
            }
            
            
            do{
                let decodedLugares = try JSONDecoder().decode([Lugar].self, from: data)
                self.lugares = decodedLugares
            }
            catch{
                self.error = .invalidData
                print("ERROR invalid data", error)
            }
            
        }catch{
            self.error = .requestError
            print("ERROR request error", error)

        }
    }
}

enum LugarError: Error {
    case requestError
    case invalidURL
    case invalidResponse
    case invalidData
}
