//
//  ViewController.swift
//  ALSlideMenuController
//
//  Created by Arpit Lokwani on 3/25/17.
//  Copyright © 2017 Arpit Lokwani. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var menuShowing = false
    
    @IBOutlet weak var menuView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        menuTableView.delegate = self
        menuTableView.dataSource = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func openMenu(_ sender: AnyObject) {
        if (menuShowing) {
            self.hideMenu()
        }else{
           self.showMenu()
        }
        
        UIView.animate(withDuration: 0.3) { 
            self.view.layoutIfNeeded()
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell") as UITableViewCell!

        cell.textLabel?.text = "Cell \(indexPath.row)"
        cell.accessoryType  = .disclosureIndicator
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       // print("You tapped cell number \(indexPath.row).")
        self.hideMenu()

        if(indexPath.row == 0){
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        else{
            let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
            
            let nextViewController = storyBoard.instantiateViewController(withIdentifier: "ThirdViewController") as! ThirdViewController
            self.navigationController?.pushViewController(nextViewController, animated: true)
        }
        
        
    }
    
    
    func hideMenu() -> Void {
        leadingConstraint.constant = -200
        menuView.layer.shadowOpacity = 0
        menuShowing = !menuShowing
        
    }
    func showMenu() -> Void {
        
        leadingConstraint.constant = 0
        menuView.layer.shadowOpacity = 1
        menuShowing = !menuShowing

    }

}

