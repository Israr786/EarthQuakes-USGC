//
//  DemoTestTests.swift
//  DemoTestTests
//
//  Created by Israrul on 06/30/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import XCTest
@testable import DemoTest

//class DemoTestTests: XCTestCase {
class HomeViewModelTests: XCTestCase {

    var viewModel:HomeViewModel<MockService<FeatureCollectionResult>>!
    var serviceMock:MockService<FeatureCollectionResult>!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let viewController = HomeViewController()
        serviceMock = MockService<FeatureCollectionResult>()
        viewModel = HomeViewModel(homeViewControllerProtocol:viewController, service:serviceMock)
        // viewController.homeViewModel = viewModel
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testGetNumberOfAlumbs() {
        
        
        // when there is not albums
        
        var numberOfFeatures = viewModel.getNumberOfFeatures()
        
        XCTAssertEqual(numberOfFeatures, 0,"Nubmer of features are zero")
        
        // GIVEN test data
        let geometry = Geometry(type: "Point", coordinates: [12.4435435, -32.1432, 122.098])
        let properties = Properties(mag: 5.6, place: "Reno", time: 1232132131, updated: 2132132131, url: "DEmo URL", detail: "Detaul ULR", status: "ok ", magType: "ML", type: "earcthQuakes Demo data", title: "Demo data")
        let feature = Feature(type: "Feature", properties: properties, geometry: geometry, id: "demo ID")
        let metaData = MetaData(generated: 21312321, url: "SOMe URL", title: "USH EARCH title", status: 200, api: "URL DEMO", count: 123)
        let featureResult = FeatureCollectionResult(type: "Feature Collection", metadata: metaData, features: [feature])
        
        viewModel.featureCollectionResultArray = featureResult
        
        // When
        numberOfFeatures = viewModel.getNumberOfFeatures()
        
        // THEN
        XCTAssertEqual(numberOfFeatures, 1,"Nubmer of albums is one")
    }
    
    func testFeatureTitle() {


        // when there is not albums

        var featureTitle = viewModel.getFeatureTitle(at: 0)

        XCTAssertEqual(featureTitle, "", "Name is not empty")

        // GIVEN test data
        let geometry = Geometry(type: "Point", coordinates: [12.4435435, -32.1432, 122.098])
        let properties = Properties(mag: 5.6, place: "Reno", time: 1232132131, updated: 2132132131, url: "DEmo URL", detail: "Detaul ULR", status: "ok ", magType: "ML", type: "earcthQuakes Demo data", title: "Demo data")
        let feature = Feature(type: "Feature", properties: properties, geometry: geometry, id: "demo ID")
        let metaData = MetaData(generated: 21312321, url: "SOMe URL", title: "USH EARCH title", status: 200, api: "URL DEMO", count: 123)
        let featureResult = FeatureCollectionResult(type: "Feature Collection", metadata: metaData, features: [feature])

        viewModel.featureCollectionResultArray = featureResult
        // When accessing proper index
        featureTitle = viewModel.getFeatureTitle(at: 0)

        // THEN
        XCTAssertEqual(featureTitle, "Title: Demo data","Nubmer of albums is one")

        // When accessing index DataModel of bound
        featureTitle = viewModel.getFeatureTitle(at: 2)

        // THEN
        XCTAssertEqual(featureTitle, "","Index DataModel of bound")

        // When accessing negative Index
        featureTitle = viewModel.getFeatureTitle(at: -1)
        // THEN
        XCTAssertEqual(featureTitle, "","Index DataModel of bound")

    }

     func testFeatureType() {

           // when there is not albums
           var featureType = viewModel.getFeatureType(at: 0)

            XCTAssertEqual(featureType, "", "feature type is not empty")

           // GIVEN test data
            let geometry = Geometry(type: "Point", coordinates: [12.4435435, -32.1432, 122.098])
            let properties = Properties(mag: 5.6, place: "Reno", time: 1232132131, updated: 2132132131, url: "DEmo URL", detail: "Detaul ULR", status: "ok ", magType: "ML", type: "earthquake", title: "Demo data")
            let feature = Feature(type: "Feature", properties: properties, geometry: geometry, id: "demo ID")
            let metaData = MetaData(generated: 21312321, url: "SOMe URL", title: "USH EARCH title", status: 200, api: "URL DEMO", count: 123)
            let featureResult = FeatureCollectionResult(type: "Feature Collection", metadata: metaData, features: [feature])

            viewModel.featureCollectionResultArray = featureResult

           // When accessing proper index
            featureType = viewModel.getFeatureType(at: 0)

           // THEN
           XCTAssertEqual(featureType, "Type: earthquake","Nubmer of albums is not one")

           // When accessing index DataModel of bound
            featureType = viewModel.getFeatureType(at: 2)

           // THEN
           XCTAssertEqual(featureType, "","Index DataModel of bound")

           // When accessing negative Index
            featureType = viewModel.getFeatureType(at: -1)

           // THEN
           XCTAssertEqual(featureType, "","Index DataModel of bound")

       }

    func testGetAlbum() {

           // when there is not albums
         var feature = viewModel.getFeature(at: 0)

           XCTAssertNil(feature, "feature is not nil")

           // GIVEN test data
            let geometry = Geometry(type: "Point", coordinates: [12.4435435, -32.1432, 122.098])
            let properties = Properties(mag: 5.6, place: "Reno", time: 1232132131, updated: 2132132131, url: "DEmo URL", detail: "Detaul ULR", status: "ok ", magType: "ML", type: "earthquake", title: "Demo data")
            let feature1 = Feature(type: "Feature", properties: properties, geometry: geometry, id: "demo ID")
            let metaData = MetaData(generated: 21312321, url: "SOMe URL", title: "USH EARCH title", status: 200, api: "URL DEMO", count: 123)
            let featureResult = FeatureCollectionResult(type: "Feature Collection", metadata: metaData, features: [feature1])

            viewModel.featureCollectionResultArray = featureResult


           // When accessing proper index
            feature = viewModel.getFeature(at: 0)

           // THEN
           XCTAssertNotNil(feature, "album is not nil")
          XCTAssertEqual(feature!.properties.title, "Demo data","artist name not matching")

           // When accessing index DataModel of bound
            feature = viewModel.getFeature(at: 2)

           // THEN
           XCTAssertNil(feature, "Album is not nil")

           // When accessing negative Index
            feature = viewModel.getFeature(at: -1)

           // THEN
           XCTAssertNil(feature, "Album is not nil")
       }
}

class MockService<Model:Decodable>: ServiceProtocol, GenericJsonDecoder {
    typealias DataModel = Model
    var mockResponceFileName:String?
    func fetchDataFrom(baseUrl: String, path: String, parameters: String, completion: @escaping (Result<Model, NetworkError>) -> Void) {

        let url = Bundle.main.url(forResource: mockResponceFileName, withExtension: "json")!
        do {
            let jsonData = try Data(contentsOf: url)
            
            if let tracks =  self.decode(input: jsonData) {
                completion(.success(tracks))
            }else {
                completion(.failure(.dataParsinFailed))
            }
        }
        catch {
            completion(Result.failure(.dataParsinFailed))
        }


    }

    func downloadImageFrom(url: String, completion: @escaping imageDownlaodCompletionHandler) {

    }
}
