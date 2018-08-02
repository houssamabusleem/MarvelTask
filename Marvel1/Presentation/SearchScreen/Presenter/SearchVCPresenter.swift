//
//  SearchVCPresenter.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation


protocol SearchVCPresenterProtocol {
    
    init(vc:SearchMainVCProtocol?)
    var charactersArr: [Character]?{get set}
    func getCharacters(name:String , ofst:Int?)
    func loadMore(name:String , offset:Int)
}


class SearchVCPresenter:SearchVCPresenterProtocol{
    
    //MARK:MEMBERS
    var charactersArr: [Character]? = [Character]()
    var tableData:[ResultData]?
    var getCharactersUseCase : GetCharactersUseCaseProtocol?
    var vc:SearchMainVCProtocol?
    
    
    
    required init(vc:SearchMainVCProtocol?){
        self.vc = vc
        getCharactersUseCase = ServiceLocator.charactersUseCase()
    }
    
    
    func getCharacters(name:String , ofst:Int?) {
        
        
        getCharactersUseCase?.execute(name: name, offset: ofst, result: {
            (ucResult) in
            if let ucRes = ucResult.results {
                if(ucResult.offset! > 0 ){
                    self.charactersArr?.append(contentsOf: ucRes)
                }else{
                    self.charactersArr = ucRes
                }
            }
            
            self.vc?.refreshData(total:ucResult.total!,offset:ucResult.offset!,count:ucResult.count!)
        }){
            (error) in
            self.vc?.showMessage(title:"Error" ,str:error.localizedDescription)
        }
    }
    
    func loadMore(name:String,offset: Int) {
        getCharacters(name:name , ofst:offset)
    }
    
    
    
    
    
}
