//
// Created by AUTHOR
// Copyright (c) YEAR AUTHOR. All rights reserved.
//

import Foundation
import UIKit

class LocationDetailPresenter: NSObject
{
    weak var view: LocationDetailViewInput?
    var interactor: LocationDetailInteractorInput?
    var wireFrame: LocationDetailWireFrameInput?
    var viewModel: LocationDetailViewModel!
}

// MARK:
// MARK: VIEW
extension LocationDetailPresenter: LocationDetailViewOutput {
    func viewDidLoad() {
        
    }
    
    func viewWillAppear() {
        interactor?.doGetForecastWeatherData(viewModel.lat, viewModel.long)
    }
    
    func doClosePressed() {
        wireFrame?.doDismissScreen()
    }
}

// MARK:
// MARK: INTERACTOR
extension LocationDetailPresenter: LocationDetailInteractorOutput {
    func didGetData(_ data: ForecastWeatherDataModel) {
        viewModel.doUpdateForecastDat(data)
        view?.doReloadView()
        DLog("didGetData: \(data)")
    }
    
    func didGetFailed(_ err: Error) {
        
    }
}

// MARK:
// MARK: WIRE FRAME
extension LocationDetailPresenter: LocationDetailWireFrameOutput {
    
}
