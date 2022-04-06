//
//  Store.swift
//  ReduxDemo
//
//  Created by Biswajyoti Sahu on 20/02/22.
//

import ReSwift

let appStore = Store<AppState>(reducer: appReducer, state: nil, middleware: [actionInterceptor], automaticallySkipsRepeats: true)
