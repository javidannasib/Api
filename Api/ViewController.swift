//
//  ViewController.swift
//  Api
//
//  Created by Javidan Nasib on 27.02.24.
//

import UIKit

class ViewController: UIViewController {
    
    let viewModel = FlightViewModel
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func fetchData(){
        viewModel.getList{result in
            switch result {
            case .success:
                self.handleSucces()
            case .failure(let error):
                self.handleFailure(error: error)
            }}
    }
    
    func handleSucces() {
        
    }
    
    func handleFailure () {
        print("network error: \(error)")
    }
 

}

class FlightResponse : Codable {
    
}
