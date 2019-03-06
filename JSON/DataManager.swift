//
//  DataManager.swift
//  JSON
//
//  Created by Kole Peoples on 3/6/19.
//  Copyright © 2019 Kole Peoples. All rights reserved.
//

import UIKit

class DataManager: NSObject {
    
    let MYJSONURL = "https://api.myjson.com/bins/136w0u" // come up with your own list Kole
    
    var dataArray = ["Nothing yet cuh"]
    
    func getData(completion: @escaping (_ success: Bool) -> ()) {
        var success = true
        
        let actualUrl = URL(string: MYJSONURL)
        
        let task = URLSession.shared.dataTask(with: actualUrl!) { (data, response, error) in
            
            if let _ = data, error == nil {
                if let jsonObj = try? JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? NSDictionary {
                    
                    if let veggieArray = jsonObj!.value(forKey: "characters") as? Array<String> {
                        self.dataArray = veggieArray
                        
                        print(jsonObj!.value(forKey: "characters")!)
                    }
                }
            } else {
                success = false
            }
    
            completion(success)
        }
        task.resume()

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
