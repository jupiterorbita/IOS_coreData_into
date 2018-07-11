//
//  ViewController.swift
//  coreDataIntro2
//
//  Created by J on 7/10/2018.
//  Copyright © 2018 Jman. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    var appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var tableData: [Post] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchAllPosts()
        
    }

    func fetchAllPosts() {
        let request:NSFetchRequest<Post> = Post.fetchRequest()
        do {
            let posts = try context.fetch(request)
            // Here we can store the fetched data in an array
//            tableData = posts
//            tableView.reloadData()
            for post in posts {
                print(post.title, post.created_at)
            }
        } catch {
            print(error)
    }
    }
    
    // update , set attributes and save
    
    func deletePost(post: Post) {
        context.delete(post)
        appDelegate.saveContext()
    }
    
    func createPost() {
        let context = appDelegate.persistentContainer.viewContext
        let post = Post(context: context)
        // set any attributes
        post.title = "Hello World"
        post.updated_at = Date()
        // save the context
        appDelegate.saveContext()
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

