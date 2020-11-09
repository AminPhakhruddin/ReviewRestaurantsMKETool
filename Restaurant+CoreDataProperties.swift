//
//  Restaurant+CoreDataProperties.swift
//  ReviewRestaurantsMKETool
//
//  Created by Amin Phakhruddin on 11/8/20.
//
//

import Foundation
import CoreData


extension Restaurant {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var name: String?
    @NSManaged public var type: String
    @NSManaged public var reviews: NSSet?
    
    var restaurantType: Type {
        set {
            type = newValue.rawValue
        }
        get {
            Type(rawValue: type) ?? .fastFood
        }
    }
    
    public var reviewsArray: [Review] {
        let set = reviews as? Set<Review> ?? []
        
        return set.sorted {
            $0.id < $1.id
        }
    }

}

// MARK: Generated accessors for reviews
extension Restaurant {

    @objc(addReviewsObject:)
    @NSManaged public func addToReviews(_ value: Review)

    @objc(removeReviewsObject:)
    @NSManaged public func removeFromReviews(_ value: Review)

    @objc(addReviews:)
    @NSManaged public func addToReviews(_ values: NSSet)

    @objc(removeReviews:)
    @NSManaged public func removeFromReviews(_ values: NSSet)

}

extension Restaurant : Identifiable {

}

enum Type: String {
    case fastFood = "Fast Food"
    case casualDining = "Casual Dining"
    case fineDining = "Fine Dining"
}
