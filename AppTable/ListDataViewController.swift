//
//  ListDataViewController.swift
//  AppTable
//
//  Created by Kaznacheev on 22.10.2021.
//

import UIKit

class ListDataViewController: UITableViewController {
    
    var plac = Plase.getPlasess()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plac.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CastomTableViewCell

        var placIndex = plac[indexPath.row]
        
        cell.nameLabel.text = placIndex.name
        
        if placIndex.image == nil {
            cell.imagesOfPlase.image = UIImage(named: placIndex.restaurantImage!)
        } else {
            cell.imagesOfPlase.image = placIndex.image
        }
        
        cell.locationLabel.text = placIndex.location
        cell.typeLabel.text = placIndex.type
        
        cell.imagesOfPlase.layer.cornerRadius = cell.imagesOfPlase.frame.size.height / 2 // Картинки круглые
        cell.imagesOfPlase.clipsToBounds = true // Отступ 
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    @IBAction func unwindSegue (_ segue: UIStoryboardSegue) {
        guard let newPlaceVC = segue.source as? NewPlaceViewController else {return}
            
        newPlaceVC.saveNewPlase()
        plac.append(newPlaceVC.newPlace)
        tableView.reloadData()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
