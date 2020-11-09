//
//  Review+CoreDataProperties.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/8/20.
//
//

import Foundation
import CoreData


extension Review {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Review> {
        return NSFetchRequest<Review>(entityName: "Review")
    }

    @NSManaged public var numStars: Int16
    @NSManaged public var date: Date
    @NSManaged public var notes: String?
    @NSManaged public var id: UUID?
    @NSManaged public var restaurant: Restaurant?
    
    public var wrappedNotes: String {
        notes ?? "Unknown review notes"
    }

}

extension Review : Identifiable {

}
