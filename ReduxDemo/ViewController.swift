//
//  ViewController.swift
//  ReduxDemo
//
//  Created by Biswajyoti Sahu on 20/02/22.
//

import UIKit
import ReSwift

class ViewController: UIViewController {

    @IBOutlet weak var chooseWeaponLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        updatePlayerAction()
        appStore.subscribe(self)
    }

    @IBAction func rockButtonPressed(_ sender: Any) {
        
        appStore.dispatch(ChooseWeaponAction(weapon: .rock))
    }
    
    @IBAction func paperButtonPressed(_ sender: Any) {
        
        appStore.dispatch(ChooseWeaponAction(weapon: .paper))
    }
    @IBAction func scissorButtonPressed(_ sender: Any) {
        
        appStore.dispatch(ChooseWeaponAction(weapon: .scissor))
    }
    
    private func updatePlayerAction() {
        
        chooseWeaponLabel.text = AppState().message.rawValue
    }
    
    
}

extension ViewController: StoreSubscriber {
    
    func newState(state: AppState) {
        
        guard let result = state.result else {
            
            chooseWeaponLabel.text = state.message.rawValue
            return
            
        }
        
        updatePlayerAction()
        resultLabel.text = state.message.rawValue
    }
}

