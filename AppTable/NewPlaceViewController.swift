//
//  NewPlaceViewController.swift
//  AppTable
//
//  Created by Kaznacheev on 26.10.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    @IBOutlet weak var imagesOfPicker: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Удаляем не нужные линии у Table
        tableView.tableFooterView = UIView()
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
            
            let sectionSheet = UIAlertController(
                                                title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet
                                            )
            let camera = UIAlertAction(title: "Camera", style: .default ) { _ in
                self.shooseImagePicker(souce: .camera)
            }
            
            let photo = UIAlertAction(title: "Photo", style: .default ) { _ in
                self.shooseImagePicker(souce: .photoLibrary)
            }
            
            let cansel = UIAlertAction(title: "Cansel", style: .cancel )
            
            sectionSheet.addAction(camera)
            sectionSheet.addAction(photo)
            sectionSheet.addAction(cansel)
            
            present(sectionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
        
    }
}

// MARK: Text field delegate
extension NewPlaceViewController: UITextFieldDelegate {
    //Скрываем клавиатуру при нажатии на Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}

// MARK: Work with image
extension NewPlaceViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func shooseImagePicker ( souce: UIImagePickerController.SourceType) {
        
        if UIImagePickerController.isSourceTypeAvailable(souce) {
            var imagesPicker = UIImagePickerController()
            imagesPicker.delegate = self
            imagesPicker.allowsEditing = true
            imagesPicker.sourceType = souce
            present(imagesPicker, animated: true)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imagesOfPicker.image = info[.editedImage] as? UIImage
        imagesOfPicker.contentMode = .scaleAspectFit
        imagesOfPicker.clipsToBounds = true
        dismiss(animated: true)
    }
}
