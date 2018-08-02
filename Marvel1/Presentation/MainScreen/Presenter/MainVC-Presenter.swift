//
//  MainVC-Presenter.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

protocol MainVCPresenterProtocol {
    //var charactersRespArr:ResultData?{get set}
    var charactersArr: [Character]?{get set}
    func loadMore(offset:Int)
    init(vc:SearchMainVCProtocol?)
    func getCharacters(name:String? , ofst:Int?)
}


class MainVCPresenter: MainVCPresenterProtocol {
    
    //MARK:MEMBERS
    var charactersRespArr: ResultData?
    var charactersArr: [Character]? = [Character]()
    var vc:SearchMainVCProtocol?
    var tableData:[ResultData]?
    var getCharactersUseCase : GetCharactersUseCaseProtocol?
     
    required init(vc:SearchMainVCProtocol?){
        
        self.vc = vc
        getCharactersUseCase = ServiceLocator.charactersUseCase()
    }
    
    func getCharacters(name:String? , ofst:Int?) {
      
        
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
    
    func loadMore(offset: Int) {
        getCharacters(name:nil , ofst:offset)
    }
    
}
