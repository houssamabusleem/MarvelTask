//
//  CharacterDetailVC.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//


///CSES is an abrv. of COMICS SERIES EVENTS STORIES

import UIKit

protocol CharacterDetailVCProtocol {
    func showMessage(title:String,str:String)
}


class CharacterDetailVC: UIViewController ,UICollectionViewDelegate,UICollectionViewDataSource ,UIScrollViewDelegate ,CharacterDetailVCProtocol{
    
    @IBOutlet weak var charDescription: UILabel!
    @IBOutlet weak var charName: UILabel!
    var selectedCharacter:Character?
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var backgroundImg: UIImageView!
    @IBOutlet weak var comicsCollectionView: UICollectionView!
    @IBOutlet weak var seriesCollectionView: UICollectionView!
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    private let cellReuseIdentifier = "horizontalCells"
    var presenter:CharacterDetailPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.backgroundImg.addBlurEffect()
        scrollView.delegate = self
        comicsCollectionView.delegate = self
        comicsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        eventsCollectionView.dataSource = self
        seriesCollectionView.delegate = self
        seriesCollectionView.dataSource = self
        setScrollViewHeight()
        presenter = ServiceLocator.getCharacterDetailPresenter(vc: self)
        //Load the background image and load the character main Image
        let urlString = selectedCharacter?.thumbnail?.thumbnail_url(size: Thumbnail_Size.standard_medium.rawValue)
        let url = URL(string: urlString!)
        var urlRequest = URLRequest(url:url!)
        let placeholderImage = UIImage(named:"icn-nav-close-white")!
        let placeholderImageBg = UIImage(named:"blackBg")
        self.characterImage.af_setImage(withURL: url!, placeholderImage: placeholderImage)
        self.backgroundImg.af_setImage(withURL: url!, placeholderImage: placeholderImageBg)
        self.charName.text = selectedCharacter?.name
        self.charDescription.text = selectedCharacter?.description
        
    }
    
    func setScrollViewHeight(){
        //Automatically set layout heights
        var contentRect = CGRect.zero
        for view in scrollView.subviews {
        contentRect = contentRect.union(view.frame)
        }
        scrollView.contentSize = contentRect.size
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if collectionView == self.eventsCollectionView {
            return (selectedCharacter?.events?.items?.count)!
              }
        else if (collectionView == self.seriesCollectionView){
            return (selectedCharacter?.series?.items?.count)!
        }
        else if (collectionView == self.comicsCollectionView)
        {
            return (selectedCharacter?.comics?.items?.count)!
        }
        return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //Can Use a collection view containing the 4 collection views as well instead of of using scrollview
        
        if collectionView == self.comicsCollectionView {
            
            
            if let comicsCell = comicsCollectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? HorizontalCvCell{
                //Set Label
                comicsCell.label.text = selectedCharacter?.comics?.items![indexPath.row].name
                //Get Image + Set in closure
                let urlString = selectedCharacter?.comics?.items![indexPath.row].resourceURI
                //FIXME:-
                let placeholderImage = UIImage(named:"icn-nav-close-white")!
                
                presenter?.getCSESPhoto(uri: urlString!, type: .COMICS, completion: {
                    result in
                    
                    let photoUrl = URL(string: (result.thumbnail?.thumbnail_url(size: Thumbnail_Size.portrait_small.rawValue))!
                        )
                    
                    comicsCell.img.af_setImage(withURL: photoUrl!, placeholderImage: placeholderImage)
                })
                
                // Thumbnail (size: Thumbnail_Size.standard_medium.rawValue)
                
//                presenter?.
//                let url = URL(string: urlString!)
//                var urlRequest = URLRequest(url:url!)
//                comicsCell.configureCell(url: <#T##URL#>, title: <#T##String#>)
                return comicsCell
            }
            
            
        }else if collectionView == self.seriesCollectionView {
            if let seriesCell = seriesCollectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? HorizontalCvCell{
                
                seriesCell.label.text = selectedCharacter?.series?.items![indexPath.row].name
                //Get Image + Set in closure
                let urlString = selectedCharacter?.series?.items![indexPath.row].resourceURI
                //FIXME:-
                let placeholderImage = UIImage(named:"icn-nav-close-white")!
                
                presenter?.getCSESPhoto(uri: urlString!, type: .SERIES, completion: {
                    result in
                    
                    let photoUrl = URL(string: (result.thumbnail?.thumbnail_url(size: Thumbnail_Size.portrait_small.rawValue))!
                    )
                    
                    seriesCell.img.af_setImage(withURL: photoUrl!, placeholderImage: placeholderImage)
                })
                return seriesCell
            }
        }
        else if collectionView == self.eventsCollectionView {
            if let eventsCell = eventsCollectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as? HorizontalCvCell{
                 eventsCell.label.text = selectedCharacter?.events?.items![indexPath.row].name
                
                //Get Image + Set in closure
                let urlString = selectedCharacter?.events?.items![indexPath.row].resourceURI
                //FIXME:-
                let placeholderImage = UIImage(named:"icn-nav-close-white")!
                
                presenter?.getCSESPhoto(uri: urlString!, type: .EVENTS, completion: {
                    result in
                    
                    let photoUrl = URL(string: (result.thumbnail?.thumbnail_url(size: Thumbnail_Size.portrait_small.rawValue))!
                    )
                    
                    eventsCell.img.af_setImage(withURL: photoUrl!, placeholderImage: placeholderImage)
                })
                return eventsCell
            }
        }
        return UICollectionViewCell()
    }
    
    @IBAction func backBtn(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func showMessage(title:String,str:String){
        MessagesAndAlerts.showAlert(title: title, message:str, btnText: "OK")
        //
    }
    
}




