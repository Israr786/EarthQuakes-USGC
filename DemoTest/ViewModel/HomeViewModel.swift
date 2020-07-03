//
//  HomeViewModel.swift
//  DemoTest
//
//  Created by Israrul on 6/30/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation

protocol HomeViewModelProtocol {
    func getFeatureResults()
 //   func getImage(url:String, indexPath:IndexPath) -> Data?
    func getNumberOfFeatures() -> Int
    func getFeatureTitle(at index:Int) -> String
    func getFeatureType(at index:Int) ->  String
    func getFeature(at index:Int) -> Feature?
    func getMag(at index:Int) -> String
    func getMagType(at index:Int) -> String
    func getPlace(at index:Int) -> String
    func getTime(at index:Int) -> String
}
class HomeViewModel<T:ServiceProtocol>:HomeViewModelProtocol {
   
    weak var homeViewController:HomeViewControllerProtocol?
    var featureCollectionResultArray:FeatureCollectionResult? {
        didSet {
            DispatchQueue.main.async {
                self.homeViewController?.refreshUI()
            }
        }
    }
    var service:T?
    let imageCache = WrappedCache<AnyObject, AnyObject>()

    var imageDownloadInProgress:[IndexPath] = []
    init(homeViewControllerProtocol:HomeViewControllerProtocol, service:T) {
        self.homeViewController = homeViewControllerProtocol
        self.service = service
    }
    func getFeatureResults() {
        guard let service = service else { return }
        service.fetchDataFrom(baseUrl:EndPoints.baseUrl.rawValue, path:EndPointsPath.search.rawValue, parameters:"format=geojson&starttime=2020-01-01&endtime=2020-01-02") { [weak self] (result )  in
            switch result {
            case .success(let model):
                self?.featureCollectionResultArray = model as? FeatureCollectionResult
            case .failure(let error):
                
//                self?.errorMessage = error.localizedDescription
//
                print(error.localizedDescription)
            }
        }
    }
    
    func getNumberOfFeatures() -> Int {
        if let featureResults = featureCollectionResultArray {
            return featureResults.features.count
        }
        return 0
    }
    func getFeatureTitle(at index:Int) -> String {
        guard let featureResults = featureCollectionResultArray else {
            return ""
        }
        if index < featureResults.features.count && index >= 0 {
            return "Title: " + featureResults.features[index].properties.title
        }
        return ""
    }
    func getFeatureType(at index:Int) -> String {
        guard let featureResults = featureCollectionResultArray else {
            return ""
        }
        if index < featureResults.features.count && index >= 0 {
            return "Type: " + featureResults.features[index].properties.type
        }
        return ""
    }
    
    func getFeature(at index:Int) -> Feature? {
        guard let featureResults = featureCollectionResultArray else {
            return nil
        }
        if index < featureResults.features.count && index >= 0 {
            return featureResults.features[index]
        }
        return nil
    }
    
    func getMag(at index: Int) -> String {
        guard let featureResults = featureCollectionResultArray else {
            return ""
        }
        if index < featureResults.features.count && index >= 0 {
            return "Magnitude: " + String(featureResults.features[index].properties.mag)
        }
        return ""
    }
    
    func getMagType(at index: Int) -> String {
        guard let featureResults = featureCollectionResultArray else {
            return ""
        }
        if index < featureResults.features.count && index >= 0 {
            return "MagnitudeType: " + featureResults.features[index].properties.magType
        }
        return ""
    }
    
    func getPlace(at index: Int) -> String {
        guard let featureResults = featureCollectionResultArray else {
            return ""
        }
        if index < featureResults.features.count && index >= 0 {
            return "Place: " + featureResults.features[index].properties.place
        }
        return ""
    }
    
    func getTime(at index: Int) -> String {
        guard let featureResults = featureCollectionResultArray else {
            return ""
        }
        if index < featureResults.features.count && index >= 0 {
            let timeResult = Double(featureResults.features[index].properties.time)
            let date = Date(timeIntervalSince1970: timeResult)
            let dateFormatter = DateFormatter()
            dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
            return "Time: " + localDate
        }
        return ""
    }
}
