//
//  ViewController.swift
//  Lesson 7 Video Game
//
//  Created by Bryan on 5/16/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource { //33rd
    
    
    @IBOutlet weak var tableView: UITableView!     //25th
    
    var characters: [Character] = []    //26th
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        tableView.dataSource = self      //31st
        tableView.delegate = self     //32nd
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {   //27th
        getCharacters()   //29th
        tableView.reloadData()   //30th
        
    }
    
    func getCharacters() {   //28th
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do {
            characters = try context.fetch(Character.fetchRequest()) as! [Character]
            print(characters)
        } catch {
            print("shit dont work")
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {     // 34th
        return characters.count    //35th
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {   //36th
        let cell = UITableViewCell()
        let character = characters[indexPath.row]     //37th
        
        cell.textLabel?.text = character.name! //38th
        cell.imageView?.image = UIImage(data: character.image! as Data)   //40th  creates a UI image out of NS data. it wants just data and not ns data so also gotta put as Data
        
        return cell   //39th
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        //41st
        
        let character = characters[indexPath.row]    //43rd
        performSegue(withIdentifier: "characterSegue", sender: character)  //44th
        
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {  //45th
        let nextVC = segue.destination as! AddCharacterViewController
        nextVC.character = sender as? Character
        
    }
    
    
}











// embed in navigation controller 1st
// add bar button item to top .  system item = add        2nd
//control drag from plus button to other view controller eliminates need for perform segue 3rd
// search and add navigation controller item to 2nd view controller and drag under vc scene under view 4th
// add image view 5th
// add text field 6th
// add button 7th
// click drag to files to add image to file. create groups.  click image view.  caarrot image. click name of file.  8th
// create new cocoa touch view controller for code.  click yellow circle on storyboard and connect custom class to addcharactervc 9th




//19th   add entity. for entity, click class codegen: class definition. add attributes name and image.  image type is binary data. click and then click on the shield and check allow external storage. uncheck optional for both


//23rd add tableview to view controller storyboard. 0's for all, uncheck constrain margins box

//24th get rid of adjust scroll inserts




