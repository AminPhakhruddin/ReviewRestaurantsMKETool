////
////  Restaurant+CoreDataProperties.swift
////  ReviewRestaurantsMKETool
////
////  Created by Amin Phakhruddin on 11/5/20.
////
////
//
//import Foundation
//import CoreData
//
//
//extension Restaurant {
//
//    @nonobjc public class func fetchRequest() -> NSFetchRequest<Restaurant> {
//        return NSFetchRequest<Restaurant>(entityName: "Restaurant")
//    }
//
//    @NSManaged public var id: UUID?
//    @NSManaged public var name: String
//    @NSManaged public var type: String
//
//    var restaurantType: Type {
//        set {
//            type = newValue.rawValue
//        }
//        get {
//            Type(rawValue: type) ?? .fastFood
//        }
//    }
//
//}
//
//extension Restaurant : Identifiable {
//
//}
//
//enum Type: String {
//    case fastFood = "Fast Food"
//    case casualDining = "Casual Dining"
//    case fineDining = "Fine Dining"
//}
