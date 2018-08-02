//
//  ServiceLocator.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.//

import Foundation

class ServiceLocator{

    //PRESENTERS
    static func  getMainPresenter(vc:SearchMainVCProtocol) -> (MainVCPresenterProtocol){
        return MainVCPresenter(vc:vc)
    }
    
    static func  getSearchPresenter(vc:SearchMainVCProtocol) -> (SearchVCPresenterProtocol){
        return SearchVCPresenter(vc:vc)
    }
    
    static func  getCharacterDetailPresenter(vc:CharacterDetailVCProtocol) -> (CharacterDetailPresenterProtocol){
        
        return CharacterDetailPresenter(vc:vc)
    }
    
    //USECASES
    static func charactersUseCase()->GetCharactersUseCaseProtocol{
        return GetCharactersUseCase()
    }
    
    static func charComicsUseCase()->GetCharactersCSEUseCaseProtocol{
        return GetcharactersComicsUseCase()
    }
    static func charEventsUseCase()->GetCharactersCSEUseCaseProtocol{
        return GetCharacterEventsUseCase()
    }
    static func charSeriesUseCase()->GetCharactersCSEUseCaseProtocol{
        return GetCharacterSeriesUseCase()
    }
    
    //REPOSITORIES
    static func getCharComicsRepo()-> CSERepositoryProtocol{
         return ComicsOnlineRepository()
    }
    static func getCharSeriesRepo()-> CSERepositoryProtocol{
        return SeriesOnlineRepository()
    }
    static func getCharEventsRepo()-> CSERepositoryProtocol{
        return EventsOnlineRepository()
    }
    
    static func MainScreenRepository()->(MainScreenRepositoryProtocol){

        if CheckConnection.isConnectedToNetwork(){
           return MainScreenOnlineRepository()
       }else{
          print("Internet Connection not Available!")
           return MainScreenCoreDataRepository()
       }
        
       
    }
    
}
