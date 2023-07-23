//
//  CountryData+CoreDataProperties.swift
//  CoreDataWithTableView
//
//  Created by Sainath Bamen on 14/07/23.
//
//

import Foundation
import CoreData


extension CountryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryData> {
        return NSFetchRequest<CountryData>(entityName: "CountryData")
    }

    @NSManaged public var countryname: String?

}

extension CountryData : Identifiable {

}
