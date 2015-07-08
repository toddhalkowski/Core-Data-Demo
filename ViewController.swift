//
//  ViewController.swift
//  Core Data Demo
//
//  Created by todd d Halkowski on 7/7/15.
//  Copyright (c) 2015 Geneva. All rights reserved.
// this code will remove, update and search for items in core data (using predicates)

import UIKit
import CoreData

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var appDel:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        var context:NSManagedObjectContext = appDel.managedObjectContext!
        
        // above context provides a framework from which we can access our core data database
        
        
       // var newUser = NSEntityDescription.insertNewObjectForEntityForName("Users", inManagedObjectContext: context)
        //    as! NSManagedObject
        
     //  newUser.setValue("Robbie", forKey: "userName")
        
    //    newUser.setValue("pass3", forKey: "password")
        
    //   context.save(nil)
        
        var request = NSFetchRequest(entityName: "Users")
        
        request.returnsObjectsAsFaults =  false
        
        request.predicate = NSPredicate(format: "userName = %@", "Kirsten")
        
        
        var results = context.executeFetchRequest(request, error: nil)
        
        if results?.count > 0 {
            
            println(results)
            
           
        
        for result: AnyObject in results! {
            
            
            
            if let user = result.valueForKey("userName") as? String {
                
                if user == "Kirsten" {
                    
                   // context.deleteObject(result as! NSManagedObject)
                    
                 //   println( user + " has been deleted")
                    
                   result.setValue("pass6", forKey: "password")
                    
                    
                    
                    
                }
            }
            
        context.save(nil)
            
        }
        }
        
        else {
            
            println("no results")
            
            
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

