//
//  FlightViewModel.swift
//  Api
//
//  Created by Javidan Nasib on 27.02.24.
//

import UIKit

class FlightViewModel {
    
    var flightResponse : FlightResponse? = nil
    
    func getList (completipon: @escaping (Result<Void, NetworkError>)->Void) {
        let url = "https://65a7624794c2c5762da692dd.mockapi.io/api/v1/flights"
        NetworkManager.shared.fetchData(from: url, method: .get, body: nil) { (result : Result<FlightResponse, NetworkError>)  in
            switch result{
            case .success(let flightResponse) :
                self.flightResponse = flightResponse
                completipon(.success( () ))
                break
            case .failure(let error) :
                completipon(.failure(error))
                break
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
