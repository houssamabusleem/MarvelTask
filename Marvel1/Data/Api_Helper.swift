//
//  Constants.swift
//  Marvel1
//
//  Created by Houssam Abusleem on 7/20/18.
//  Copyright © 2018 MRamadan@ntg. All rights reserved.
//

import Foundation

///MARK:- API_CONSTANTS
enum API_MARVEL {
    //Base
    static let BASE_URL = "http://gateway.marvel.com"
    static let API_PATH = "/v1/public"
    static let CHARACTERS_URL = "/characters?"
    //     static let COMICS_URL = "/characters?"
    //     static let EVENTS_URL = "/characters?"
    //     static let SERIES_URL = "/characters?"
    //     static let STORIES_URL = "/characters?"
    static let API_KEY = "807997f7a4606dc4826f37773cb9eeee"
    static let API_TIMESTAMP = "1"
    static let API_HASH = "542896bff23436bc342b5369df822f77"
    static let API_LIMIT = "20"
    
    //MD5 was replaced by SHA-1 though both were found vulenerable and SHA-2 is now recommended
    //MD5 cryptographically broken and unsuitable for further use
    
    /* http://gateway.marvel.com/v1/public/characters?ts=1&apikey=807997f7a4606dc4826f37773cb9eeee&hash=542896bff23436bc342b5369df822f77 */
}

//MARK:- API CONTROLLER
struct ApiController{
    
    //var url =  try URL(string:"")?.appendPathComponent()()
    
    var characters_url:String {
        return
            API_MARVEL.BASE_URL+API_MARVEL.API_PATH + API_MARVEL.CHARACTERS_URL
    }
    //    var comics_url:String{
    //        return
    //            API_MARVEL.BASE_URL+API_MARVEL.API_PATH + API_MARVEL.CHARACTERS_URL
    //
    //    }
    
    var query_params:[String: Any]{
        return  ["hash": API_MARVEL.API_HASH
            ,"ts":API_MARVEL.API_TIMESTAMP
            ,"apikey":API_MARVEL.API_KEY,
             "limit":API_MARVEL.API_LIMIT
        ]
    }
    
    func addParameters(nameStartsWith:String?  , offset:Int?/*,limit:Int?*/)-> [String:Any] {
        var params = query_params
        if let prm = nameStartsWith{
            params["nameStartsWith"] = prm
        }
        if let prm = offset{
            params["offset"] = prm
        }
        //SET FROM THE CONSTANTS ALREADY
        //        if let prm = limit{
        //            params["limit"] = prm
        //        }
        return params
        
    }
    
    var getHeader : [String:Any]? = nil
    
}


enum Thumbnail_Size:String{
    case  portrait_small        //50x75px
    case  portrait_medium       //100x150px
    case  portrait_xlarge       //150x225px
    case  portrait_fantastic    //168x252px
    case  portrait_uncanny      //300x450px
    case  portrait_incredible   //216x324px
    case  standard_small        //65x45px
    case  standard_medium       //100x100px
    case   standard_large        //140x140px
    case  standard_xlarge       //200x200px
    case  standard_fantastic    //250x250px
    case  standard_amazing      //180x180px
    case  landscape_small       //120x90px
    case  landscape_medium      //175x130px
    case landscape_large       //190x140px
    case  landscape_xlarge      //270x200px
    case  landscape_amazing     //250x156px
    case  landscape_incredible  //464x261px
    case  detail                //full image, constrained to 500px wide
    case  fullsize = "full-size"
}


