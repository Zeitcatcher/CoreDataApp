//
//  User+CoreDataProperties.swift
//  CoreDataApp
//
//  Created by Arseniy Oksenoyt on 9/12/23.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var login: String?
    @NSManaged public var password: String?
    @NSManaged public var userProfile: Profile?

}

extension User : Identifiable {
    @objc(addProfileObject:)
    @NSManaged public func addToProfile(_ value: Profile)


    @objc(removeUsersObject:)
    @NSManaged public func removeFromProfile(_ value: Profile)


    @objc(addProfile:)
    @NSManaged public func addToProfile(_ values: NSSet)


    @objc(removeProfile:)
    @NSManaged public func removeFromProfile(_ values: NSSet)
}
