//
//  NewPlaceViewController.swift
//  AppTable
//
//  Created by Kaznacheev on 26.10.2021.
//

import UIKit

class NewPlaceViewController: UITableViewController {

    var newPlace: Plase!
    
    @IBOutlet weak var placeImages: UIImageView!
    @IBOutlet weak var placeNameTF: UITextField!
    @IBOutlet weak var placeLocationTF: UITextField!
    @IBOutlet weak var placeTypeTF: UITextField!
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Удаляем не нужные линии у Table
        tableView.tableFooterView = UIView()
        
        // отключение кнопки сохранить
        saveButton.isEnabled = false
        //
        placeNameTF.addTarget(self, action: #selector(textFieldChanged), for: .editingChanged)
    }
    
    // MARK: Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        if indexPath.row == 0 {
            
            // Прописываем иконки для Фото и Камеры
            let camerIcon = UIImage(named: "camera")
            let photoIcon = UIImage(named: "photo")

            let sectionSheet = UIAlertController(
                                                title: nil,
                                                message: nil,
                                                preferredStyle: .actionSheet
                                            )
            let camera = UIAlertAction(title: "Camera", style: .default ) { _ in
                self.shooseImagePicker(souce: .camera)
            }
            // Указывааем вывод иконки и положение текста у икнки
            camera.setValue(camerIcon, forKey: "Image")
            camera.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            
            let photo = UIAlertAction(title: "Photo", style: .default ) { _ in
                self.shooseImagePicker(souce: .photoLibrary)
            }
            // Указывааем вывод иконки и положение текста у икнки
            photo.setValue(photoIcon, forKey: "Image")
            photo.setValue(CATextLayerAlignmentMode.left, forKey: "titleTextAlignment")
            
            let cansel = UIAlertAction(title: "Cansel", style: .cancel )
            
            sectionSheet.addAction(camera)
            sectionSheet.addAction(photo)
            sectionSheet.addAction(cansel)
            
            present(sectionSheet, animated: true)
            
        } else {
            view.endEditing(true)
        }
    }
    
    // Сохраняем данные
    func saveNewPlase(){
        newPlace = Plase(
                            name: placeNameTF.text!,
                            location: placeLocationTF.text,
                            type: placeTypeTF.text,
                            image: placeImages.image,
                            restaurantImage: nil
                        )
    }
    // Кнопка Cansel
    @IBAction func canselAction(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
}

// MARK: Text field delegate
extension NewPlaceViewController: UITextFieldDelegate {
    //Скрываем клавиатуру при нажатии на Done
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @objc private func textFieldChanged(){
        // Проверяем заполенение поля Name если заполненно то кнопка доступна
        if placeNameTF.text?.isEmpty == false {
            saveButton.isEnabled = true
        } else {
            saveButton.isEnabled = false
        }
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
        placeImages.image = info[.editedImage] as? UIImage
        placeImages.contentMode = .scaleAspectFit
        placeImages.clipsToBounds = true
        dismiss(animated: true)
    }
}
