//
//  ViewController.swift
//  moodTracker
//
//  Created by Barbarian Mogul on 11/8/18.
//  Copyright © 2018 Makhmud Islamov. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var entries: [MoodEntry] = []
    
    @IBOutlet weak var tableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let goodEntry = MoodEntry(mood: .good, date: Date())
        let badEntry = MoodEntry(mood: .bad, date: Date())
        let neutralEntry = MoodEntry(mood: .neutral, date: Date())
        
        entries = [goodEntry, badEntry, neutralEntry]
        tableView.reloadData()
        
    }



}


// extending delegate and dataSource
extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return entries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mood entry cell", for: indexPath)
        
        let entry = entries[indexPath.row]
        cell.textLabel?.text = entry.mood.stringValue
        cell.detailTextLabel?.text = String(describing: entry.date)
        
        return cell
    }
}



