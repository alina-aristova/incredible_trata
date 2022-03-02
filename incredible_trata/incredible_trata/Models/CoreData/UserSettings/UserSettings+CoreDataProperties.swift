//
//  UserSettings+CoreDataProperties.swift
//  incredible_trata
//
//  Created by Ryabin Kirill on 28.10.2021.
//
//

import CoreData
import Foundation

extension UserSettings {
    @nonobjc
    public class func fetchRequest() -> NSFetchRequest<UserSettings> {
        return NSFetchRequest<UserSettings>(entityName: "UserSettings")
    }

    @NSManaged public var currency: Currency?
}

extension UserSettings: Identifiable {}
