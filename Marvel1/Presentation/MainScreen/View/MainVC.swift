//
//  ViewController.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import UIKit
import AlamofireImage

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource,SearchMainVCProtocol {
   
    //MARK: OUTLETS
    @IBOutlet weak var tableViewCharacters: UITableView!
    
    //MARK: MEMBERS
    private let cellReuseIdentifier = "charactersCell"
     let segueID = "characterDetailsSegue"
    var presenter:MainVCPresenterProtocol?
    var total:Int?
    var offset:Int?
    var count:Int? //limit
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableViewCharacters.delegate = self
        self.tableViewCharacters.dataSource = self
        tableViewCharacters.rowHeight = UITableViewAutomaticDimension
        tableViewCharacters.estimatedRowHeight = 136
        //get instance of presenter to use
        presenter = ServiceLocator.getMainPresenter(vc: self)
        presenter?.getCharacters(name: nil, ofst: nil)
    }
    
    //MARK:- TABLE FUNCTIONS
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.charactersArr?.count ?? 0
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableViewCharacters.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as? CharacterCell {
            
            let charName = presenter?.charactersArr?[indexPath.row].name
            let urlString = presenter?.charactersArr?[indexPath.row].thumbnail?.thumbnail_url(size: Thumbnail_Size.landscape_medium.rawValue)
            
            let url = URL(string: urlString!)
            var urlRequest = URLRequest(url:url!)
            
            cell.configureCell(img: url!, name: charName!)
            //  cell.characterImg.af_setImage(withURL: url!, placeholderImage: placeholderImage) //cell.characterImg.af_setImage(withURLRequest: urlRequest)
            //   cell.characterNameLbl.text = charName
            //  cell.configureCell(img: UIImage(named: "marvel heroes 1c")! , name: "MyName")
            
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
                    
                    self.tableViewCharacters.tableFooterView = spinner
                    self.tableViewCharacters.tableFooterView?.isHidden = false
                    
                    loadMore(offset:self.offset)
                }
                
            }else{
                spinner.stopAnimating()
                self.tableViewCharacters.tableFooterView?.isHidden = true
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
    
    //Update ui when data is fetched
    func refreshData(total:Int,offset:Int,count:Int) {
        self.total = total
        self.offset = offset
        self.count = count
        tableViewCharacters.reloadData()
    }
    
    func  loadMore(offset:Int? = 0){
        presenter?.loadMore(offset: offset!)
    }
    
    func showMessage(title:String,str:String){
        MessagesAndAlerts.showAlert(title: title, message:str, btnText: "OK")
        //
    }
    
    
    
}

