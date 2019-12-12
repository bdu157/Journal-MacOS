//
//  MainSplitViewController.swift
//  Journal
//
//  Created by Dongwoo Pae on 12/12/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Cocoa

@objc protocol EntriesPresenter: class {
    @objc var entriesController: NSArrayController? {get set}
}

class MainSplitViewController: NSSplitViewController {

    @IBOutlet var entriesController: NSArrayController!
    
   @objc var managedObjectContext: NSManagedObjectContext {
        return CoreDataStack.shared.mainContext
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        for splitViewItem in splitViewItems {
            if let childVC = splitViewItem.viewController as? EntriesPresenter {
                childVC.entriesController = entriesController
            }
        }
        
    }
    
    @IBAction func saveDocument(_ sender: Any?) {
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch let error as NSError {
            presentError(error)
        }
    }
    
}
