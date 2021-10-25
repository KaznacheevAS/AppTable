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

        cell.nameLabel.text = plac[indexPath.row].name
        cell.imagesOfPlase.image = UIImage(named: plac[indexPath.row].images)

        cell.locationLabel.text = plac[indexPath.row].location
        cell.typeLabel.text = plac[indexPath.row].type
        
        cell.imagesOfPlase.layer.cornerRadius = cell.imagesOfPlase.frame.size.height / 2 // Картинки круглые
        cell.imagesOfPlase.clipsToBounds = true // Отступ 
        
        return cell
    }
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 95
    }
    
    @IBAction func canselAction (_ segue: UIStoryboardSegue) {}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
