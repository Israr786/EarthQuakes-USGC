//
//  AlbumDetailViewModel.swift
//  DemoTest
//
//  Created by Israrul on 6/30/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation

class DetailViewModel {
    
    weak var detailViewCtrl:DetailsViewControllerrotocol?
    var feature:Feature?

    init(feature:Feature?, detailViewCtrl:DetailsViewControllerrotocol) {
        self.detailViewCtrl = detailViewCtrl
        self.feature = feature
    }
}

