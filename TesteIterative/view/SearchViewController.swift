//
//  SearchViewController.swift
//  TesteIterative
//
//  Created by Nilson Carraro on 28/06/2018.
//  Copyright © 2018 Nilson Carraro. All rights reserved.
//

import UIKit
import Kingfisher
import NVActivityIndicatorView

class SearchViewController: ViewController, NVActivityIndicatorViewable {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtName: UITextField!
    
    var listagem: SearchResult?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sendSearch(_ sender: Any) {
        startAnimating()
        MovieService.init().searchMovie(name: self.txtName.text!, { res in
            self.listagem = res!
            self.tableView.reloadData()
            self.stopAnimating()
            
            if (self.listagem?.results?.count == 0) {
                let alert = UIAlertController(title: "Resultado", message: "Nenhum filme encontrado", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        })
        
        self.txtName.resignFirstResponder()
    }
}

extension SearchViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listagem != nil ? listagem!.results!.count : 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: "UserCell")
        let userViewData = listagem?.results?[indexPath.row]
        cell.textLabel?.text = userViewData?.title
        cell.detailTextLabel?.text = userViewData?.overview
        
        if (userViewData?.poster_path != nil) {
            let url = URL(string: String(format: Constants.URL_IMAGE, (userViewData?.poster_path)!))
            cell.imageView?.kf.setImage(with: url)
        }
        return cell
    }
    
}
