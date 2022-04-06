//
//  ActionInterceptor.swift
//  ReduxDemo
//
//  Created by Biswajyoti Sahu on 20/02/22.
//

import ReSwift

let actionInterceptor: Middleware<AppState> = { dispatch, getState in
    
    return { next in
        return { action in
            switch action {
                
            default:
                break
            }
            return next(action)
        }
        
    }
}
