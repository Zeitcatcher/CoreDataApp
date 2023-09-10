//
//  StorageManager.swift
//  CoreDataApp
//
//  Created by Arseniy Oksenoyt on 9/9/23.
//

import CoreData

class StorageManager {
    
    static let shared = StorageManager()
    
    // MARK: - Core Data stack
    private let persistantContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "User")
        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        return container
    }()
    
    private let viewContext: NSManagedObjectContext
    
    private init() {
        viewContext = persistantContainer.viewContext
    }
    
    // MARK: - CRUD
    func create(_ login: String, password: String, complition: (User) -> Void) {
        let user = User(context: viewContext)
        user.login = login
        user.password = password
        complition(user)
        saveContext()
    }
    
    // MARK: - Core Data Saving support
    func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch {
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
}
