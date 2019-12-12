//
//  EntriesTableViewController.swift
//  Journal
//
//  Created by Dongwoo Pae on 12/12/19.
//  Copyright © 2019 Dongwoo Pae. All rights reserved.
//

import Cocoa

class EntriesTableViewController: NSViewController, EntriesPresenter {

    dynamic var entriesController: NSArrayController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    @IBAction func add(_ sender: Any) {
        let _ = Entry(title: "New Entry", bodyText: "") //@disgardableResults within initializer
    }
    
    @IBAction func remove(_ sender: Any) {
        entriesController?.remove(sender)
    }
}
