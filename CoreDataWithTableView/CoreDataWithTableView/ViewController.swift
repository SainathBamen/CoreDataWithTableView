//
//  ViewController.swift
//  CoreDataWithTableView
//
//  Created by Sainath Bamen on 14/07/23.
//

import UIKit

class ViewController: UIViewController {
    var country:UITextField!
    var cData = [CountryData]()

    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
        
    }

    @IBAction func addNewData(_ sender: Any) {
        let AddMessage = UIAlertController(title: "Add Data", message: "Enter Country Name", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: . default){(action) in
            let newCountryName = self.country.text!
            let dataHandler = DataBaseHandler()
            dataHandler.saveData(cName: newCountryName)
            self.cData = dataHandler.fetchData()
            self.tableView.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (action) in
            print("Cancel The Operation.")
        }
        AddMessage.addAction(okAction)
        AddMessage.addAction(cancelAction)
        AddMessage.addTextField { textField in
            self.country = textField
            self.country.placeholder = "Type Country Name"
        }
        self.present(AddMessage, animated: true, completion: nil)
        
    }
    
}

extension ViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = cData[indexPath.row].countryname
        return cell
    }
    
    
}


