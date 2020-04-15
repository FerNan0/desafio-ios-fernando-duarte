//
//  ListagemInteractor.swift
//  desafio-ios-fernando-duarte
//
//  Created by Fernando F Duarte on 15/04/20.
//  Copyright © 2020 Fernando F Duarte. All rights reserved.
//

import UIKit

protocol callRequest {
    func request(method:String, completion: @escaping (Data) -> ())
}

class ListagemInteractor: callRequest {
    func request(method: String, completion: @escaping (Data) -> ()) {
        ConnectorHelper.request(method: method, completion: completion)
    }
    
    
}
