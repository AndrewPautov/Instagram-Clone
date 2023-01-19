//
//  DatabaseManager.swift
//  Instagram
//
//  Created by Андрей Паутов on 08.08.2021.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    //MARK: - Public
    
    /// Check if username and email is available
    /// - Parametrs
    ///     - email: String represanting email
    ///     - password: String represanting password
    public func canCreateNewUser(with email: String, username: String, completiion: (Bool) -> Void) {
        completiion(true)
    }
    
    
    /// Inserts new user data to database
    /// - Parametrs
    ///     - email: string represanting email
    ///     - password: String represanting password
    ///     - completion: Acync callback for result if database entry successed
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        let key = email.safeDatabaseKey()        
        database.child(key).setValue(["username": username]) { error, _ in
            if error == nil {
                // successed
                completion(true)
                return
            }
            else {
                // failed
                completion(false)
                return
            }
        }
    }
 
}
