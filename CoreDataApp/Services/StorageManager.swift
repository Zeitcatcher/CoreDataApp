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
        let container = NSPersistentContainer(name: "CoreDataApp")
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
    func create(_ login: String, password: String) {
        let user = User(context: viewContext)
        user.login = login
        user.password = password
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
    
    // MARK: - Core Data Fetch support
    func fetchData(login: String, complition: (Result<[User], Error>) -> Void) {
        let fetchRequest = User.fetchRequest()
        do {
            fetchRequest.predicate = NSPredicate(
                format: "(login = %@)", login
            )
            let users = try viewContext.fetch(fetchRequest)
            complition(.success(users))
        } catch let error {
            complition(.failure(error))
        }
    }
    
    // MARK: - Core Data Delete support
    func delete(_ user: User) {
        viewContext.delete(user)
        saveContext()
    }
    
    func update(_ user: User, newPassword: String) {
        user.password = newPassword
        saveContext()
    }
}
