//
//  Cuisine+CoreDataProperties.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/8/20.
//
//

import Foundation
import CoreData


extension Cuisine {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Cuisine> {
        return NSFetchRequest<Cuisine>(entityName: "Cuisine")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var type: String?

}

extension Cuisine : Identifiable {

}
