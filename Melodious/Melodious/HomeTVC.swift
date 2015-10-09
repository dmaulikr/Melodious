//
//  HomeTVC.swift
//  Melodious
//
//  Created by Charles Wesley Cho on 10/1/15.
//  Copyright (c) 2015 Charles Wesley Cho. All rights reserved.
//

import UIKit
import Parse

class HomeTVC: UITableViewController, UITableViewDelegate, UITableViewDataSource {

    var games : [[Game]] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Game.fetchData { (objects, error) -> Void in
            self.games = objects!
            self.tableView.reloadData()
        }

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {

        return 5
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var numbeOfRowsArray = [3, games[section-1].count, games[section-1].count, games[section-1].count, games[section-1].count]
        
//        var numbeOfRowsArray = [3, 1, 1, 1]

        return numbeOfRowsArray[section]
    }
    
    override func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 25
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
         let titleArray : [String] = ["New Game", "Challenges", "Waiting for Opponent", "Waiting for Judge", "Recent Games"]
    
        return titleArray[section]
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            
            var cell = tableView.dequeueReusableCellWithIdentifier("NewGameCell", forIndexPath: indexPath) as! NewGameCell
            
            let buttonTitleArray : [String] = ["Friends", "Random", "Judge"]
            // Configure cell
            cell.label.text = buttonTitleArray[indexPath.row]
            
            return cell

            
        } else {
        //grab array by section title
            var cell = tableView.dequeueReusableCellWithIdentifier("WaitingCell", forIndexPath: indexPath) as! WaitingCell

            switch indexPath.section {
                
            case 1:
                cell.setGame(games[0][indexPath.row])
                
            case 2:
                cell.setGame(games[1][indexPath.row])
                
            case 3:
                cell.setGame(games[2][indexPath.row])
            
            case 4:
                cell.setGame(games[3][indexPath.row])
                
            default:
                println("No more arrays")
                
            }
            return cell

        }
    }
    

       /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
