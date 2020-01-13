//
//  SettingsViewController.swift
//  January 13 2019 User Default Demo
//
//  Created by Margiett Gil on 1/13/20.
//  Copyright © 2020 Margiett Gil. All rights reserved.
//

import UIKit


class SettingsViewController: UITableViewController {
    
    @IBOutlet weak var unitMeasurementLabel: UILabel!
    @IBOutlet weak  var mainImage: UIImageView!

    
    var currentImage = Image.bike {
        didSet {
          
            
            mainImage.image = UIImage(named: currentImage.rawValue)
            
            UserPreference.shared.updateImage(with: currentImage)
            
        }
    }
    
    var currentUnit = UnitMeasurement.miles {
        didSet {
            //update the unitMeasurement label
            unitMeasurementLabel.text = currentUnit.rawValue
            //update value in user default
            
            UserPreference.shared.updateUnitMeasurement(with: currentUnit)
            
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func purpleButton(_ sender: UIButton) {
        view.backgroundColor = UIColor.purple
    }
    
    @IBAction func tealButton(_ sender: UIButton) {
        view.backgroundColor = UIColor.blue
    }
    
    @IBAction func pinkButton(_ sender: UIButton) {
        view.backgroundColor = UIColor.red
    }
    
    
    
    private func updateUI() {
        // retrieve any value in userdefault as needed
        if let unitMeasurement = UserPreference.shared.getUnitMesurement() {
            currentUnit = unitMeasurement
        
        }
        if let imageUpdate = UserPreference.shared.getImage() {
            currentImage = imageUpdate
        }
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // toggle between "Miles or Kilometers"
    
    
    switch indexPath.row {
    case 0:
    // toggle unit measurment label
        toggleUnitMeasurment()
    case 1:
        toggleImage()
    default:
    break
    }
        
}
private func toggleUnitMeasurment() {
    currentUnit = currentUnit == UnitMeasurement.miles ? UnitMeasurement.kilometers :
    UnitMeasurement.miles
    

   

}
    private func toggleImage() {
        currentImage = currentImage == Image.bike ? Image.run : Image.bike
    }
}
