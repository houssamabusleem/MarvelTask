//
//  CharacterDetailPresenter.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

enum CSES_TYPE{
    case EVENTS
    case SERIES
    case COMICS
}

protocol CharacterDetailPresenterProtocol {
    init(vc:CharacterDetailVCProtocol)
    func getCSESPhoto(uri:String , type:CSES_TYPE,completion:@escaping(CSEDetailed)->())
}

class CharacterDetailPresenter: CharacterDetailPresenterProtocol {
   

    var characterDetailVC:CharacterDetailVCProtocol?
    
    var getCharacterDetailComicsUseCase : GetCharactersCSEUseCaseProtocol?
    var getCharacterDetailEventUseCase : GetCharactersCSEUseCaseProtocol?
    var getCharacterDetailSeriesUseCase : GetCharactersCSEUseCaseProtocol?
   
    required init(vc: CharacterDetailVCProtocol) {
        characterDetailVC = vc
        getCharacterDetailComicsUseCase = ServiceLocator.charComicsUseCase()
        getCharacterDetailEventUseCase = ServiceLocator.charEventsUseCase()
        getCharacterDetailSeriesUseCase = ServiceLocator.charSeriesUseCase()
    
    }
    
    
    
    func getCSESPhoto(uri: String, type: CSES_TYPE, completion: @escaping(CSEDetailed) -> ()) {
        
        switch type {
        case .COMICS:
            getCharacterDetailComicsUseCase?.execute(url: uri, result: { (result) in
                    completion(result[0])
                }, failure: { (error) in
        self.characterDetailVC?.showMessage(title:"Error" ,str:error.localizedDescription)
                })
        case .EVENTS:
            getCharacterDetailEventUseCase?.execute(url: uri, result: { (result) in
                completion(result[0])
            }, failure: { (error) in
                self.characterDetailVC?.showMessage(title:"Error" ,str:error.localizedDescription)
            })
        case .SERIES:
            getCharacterDetailSeriesUseCase?.execute(url: uri, result: { (result) in
                completion(result[0])
            }, failure: { (error) in
                self.characterDetailVC?.showMessage(title:"Error" ,str:error.localizedDescription)
            })
//        default:
//            return
        }
    
    }
    
    }
