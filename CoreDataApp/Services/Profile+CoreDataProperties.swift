//
//  Profile+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Arseniy Oksenoyt on 9/12/23.
//
//

import Foundation
import CoreData


extension Profile {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Profile> {
        return NSFetchRequest<Profile>(entityName: "Profile")
    }

    @NSManaged public var name: String?
    @NSManaged public var user: User?

}

extension Profile : Identifiable {

}
