//
//  DataBaseHandler.swift
//  CoreDataWithTableView
//
//  Created by Sainath Bamen on 14/07/23.
//

import Foundation
import UIKit
import CoreData

class DataBaseHandler{
    func saveData(cName:String){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let countryObject = NSEntityDescription.insertNewObject(forEntityName: "CountryData", into: context) as! CountryData
        countryObject.countryname = cName
        do {
            try context.save()
            print("Data has been saved")
            
        }
        catch{
            print("Error has been occured during saving data")
        }
    }
    
    func fetchData()-> [CountryData]{
        var cData = [CountryData]()
        let appDe = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDe.persistentContainer.viewContext
        do{
            cData = try context.fetch(CountryData.fetchRequest()) as! [CountryData]
            
        }
        catch{
            print("Error Occured During Fetch Request")
        }
        return cData
    }
}
