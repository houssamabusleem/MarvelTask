//
//  searchVC.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import UIKit

class searchVC: UIViewController,UITableViewDataSource ,UITableViewDelegate,UISearchBarDelegate,SearchMainVCProtocol {
    
    @IBOutlet weak var searchbar: UISearchBar!
    
    //MARK: OUTLETS
    @IBOutlet weak var tableViewSearch: UITableView!
    
    
    //MARK: MEMBERS
    private let cellReuseIdentifier = "characterSearchCell"
    var presenter:SearchVCPresenterProtocol?
    var total:Int?
    var offset:Int?
    var count:Int? //limit
    var nameSearch:String = ""
    let segueID = "characterDetailsSegue"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSearch.delegate = self
        tableViewSearch.dataSource = self
        searchbar.delegate = self
        // searchBar.showsCancelButton=YES;
        presenter = ServiceLocator.getSearchPresenter(vc: self)
        presenter?.getCharacters(name: "", ofst: nil)
    }
    
    //MARK: TABLE FUNCTIONS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.charactersArr?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableViewSearch.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? CharacterCell {
            
            let charName = presenter?.charactersArr?[indexPath.row].name
            let urlString = presenter?.charactersArr?[indexPath.row].thumbnail?.thumbnail_url(size: Thumbnail_Size.landscape_medium.rawValue)
            
            let url = URL(string: urlString!)
            var urlRequest = URLRequest(url:url!)
            
            cell.configureCell(img: url!, name: charName!)
            
            return cell
        }
        return UITableViewCell()
    }
    
    
    //MARK: SHOW INDICATOR AND LOAD MORE DATA
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        let lastSectionIndex = tableView.numberOfSections - 1
        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
        //check if we reached last cell
        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
            // print("this is the last cell")
            
            
            let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
            
            
            if let count = self.count ,let offset = self.offset, let total = self.total{
                if(count + offset < total ){
                    self.offset = count+offset
                    
                    //Show spinner
                    spinner.startAnimating()
                    spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
                    
                    self.tableViewSearch.tableFooterView = spinner
                    self.tableViewSearch.tableFooterView?.isHidden = false
                    
                    loadMore(name: nameSearch, offset:self.offset)
                }
                
            }else{
                spinner.stopAnimating()
                self.tableViewSearch.tableFooterView?.isHidden = true
                return
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: self.presenter?.charactersArr?[indexPath.row])
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            if let identifier = segue.identifier {
                if identifier == segueID {
                    if let targetController = segue.destination as? CharacterDetailVC {
                        if let item = sender as? Character {
                            targetController.selectedCharacter = item
                        }
                    }
                }
            }
            
        }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    func refreshData(total: Int, offset: Int, count: Int) {
        
        self.total = total
        self.offset = offset
        self.count = count
        tableViewSearch.reloadData()
        
    }
    
    func showMessage(title:String,str:String){
        MessagesAndAlerts.showAlert(title: title, message:str, btnText: "OK")
    
    }
    
    func  loadMore(name:String ,offset:Int? = 0){
        presenter?.loadMore(name: name, offset: offset!)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        nameSearch = searchBar.text!
        presenter?.getCharacters(name: searchBar.text!, ofst: nil)
        self.view.endEditing(true)
    }
    
}

