
//
//  UserManager.swift
//  IOS-retest
//
//  Created by Laurence on 04/12/2017.
//  Copyright © 2017 Hetic. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class UserManager {
    typealias UserCompletion = (_ user: User?) -> Void
    //S'assurer que personne ne peut construire le user manager. On fait un singleton
    static let shared: UserManager = {
        return UserManager()
    }()
    
    private init() {
        
    }
    
    func getUserDetails(completionHandler: @escaping (_ user: User?) -> Void) {
        let url = "https://randomuser.me/api/"
        let parameters = ["result" : "1"]
        let hearders = ["Hetic-Groupe" : "1"]
        
        Alamofire.request(url,
                          method: .get,
                          parameters: parameters,
                          encoding: URLEncoding.default,
                          headers: hearders)
            .responseJSON {(response) in
                //résultat de la recherche réseau
                switch response.result {
                case .success(let data):
                    let json = JSON(data)
                    let resultNumber = json["info"]["results"].intValue
                    print("Nombre de résultats : \(resultNumber)")
                    
                    let resultJsonList = json["results"].arrayValue
                    if resultJsonList.isEmpty == false {
                        let userJson = resultJsonList[0]
                        let user = User(json: userJson)
                        print("Mon user: \(user.firstname)")
                        
                        //L'utilisateur existe
                        completionHandler(user)
                        
                    } else {
                        //L'utilisateur n'existe pas
                        completionHandler(nil)
                    }
                    
                    break
                case .failure(let error):
                    print("Internet request FAILED : \(error)")
                    
                    completionHandler(nil)
                    break
                }
                
        }
    }

}
