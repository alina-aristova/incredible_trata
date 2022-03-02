//
//  Record+CoreDataProperties.swift
//  incredible_trata
//
//  Created by Ryabin Kirill on 28.10.2021.
//
//

import CoreData
import Foundation

extension Record {
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var amount: Double
    @NSManaged public var creationDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var note: String?
    @NSManaged public var longitudeCoordinate: Double
    @NSManaged public var latitudeCoordinate: Double
    @NSManaged public var category: Category?
    @NSManaged public var currency: Currency?
}

extension Record: Identifiable {
}
