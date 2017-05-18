//
//  AddCharacterViewController.swift
//  Lesson 7 Video Game
//
//  Created by Bryan on 5/16/17.
//  Copyright © 2017 KO. All rights reserved.
//

import UIKit

class AddCharacterViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate { //13th and 14th
    
    
    
    @IBOutlet weak var characterImageView: UIImageView!    //10th
    
    
    @IBOutlet weak var characterTextField: UITextField!     //10th
    
    
    @IBOutlet weak var updateLabel: UIButton!   //47th  same thing as Add button
    
    
    @IBOutlet weak var deleteLabel: UIButton!    //49th
    
    
    
    var imagePicker = UIImagePickerController()      //11th  uiimagepickercontroller lets you choose from collection or take a photo
    
    
    var character : Character? = nil           //42nd
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self    //12th  where to send the image once sent. an object uses a delegate to pull some info that it needs
        
        if character != nil {  //46th
            characterImageView.image = UIImage(data: character!.image! as Data)
            characterTextField.text = character!.name
            
            updateLabel.setTitle("Update", for: .normal)   //48th  .setTitle for naming a button
        } else {
            deleteLabel.isHidden = true     //50th
        }
        
        
    }
    
    
    
    
    
    @IBAction func photosTapped(_ sender: Any) {  //10th
        
        imagePicker.sourceType = .photoLibrary     //13th
        
        present(imagePicker, animated: false, completion: nil)    //14th this places another view controller on the screen for user to choose the pic
        
        
        //15th click on info.plist. click information property list. plus button. Privacy Photo library for to gain user permission
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,    didFinishPickingMediaWithInfo info: [String : Any]) {    //16th info is dictionary. function that gets called whenever user selects a photo. hold option on keyboard to look at documentation
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage   //17th UIImage is the data around an image file and we can use this to put it inside an Image View
        
        characterImageView.image = image
        
        imagePicker.dismiss(animated: true, completion: nil)    //18th shut down the image picker
        
    }
    
    
    
    
    @IBAction func cameraTapped(_ sender: Any) {        //10th
         imagePicker.sourceType = .camera    //53rd
        
    //54th  click on info.plist. information property list. plus button.  privacy camera usage. 
        
        
    }
    
    
    @IBAction func addCharacter(_ sender: Any) {// 10th
        
        if character != nil {   //51st
            character!.name = characterTextField.text
            character!.image = UIImagePNGRepresentation(characterImageView.image!)! as NSData
            
            
            
        } else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext              //20th
            
            let character = Character(context: context)   //21st
            character.name = characterTextField.text
            character.image = UIImagePNGRepresentation(characterImageView.image!)! as NSData    //changing the nsdata to UIimage view
            
        }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()  //22nd
        
        navigationController!.popViewController(animated: true)
        
    }
    
    
    
    @IBAction func deleteLabel(_ sender: Any) {   //52nd  use same action title as the outlet above
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        context.delete(character!)
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        
        navigationController!.popViewController(animated: true)
    }
    
    
}


















