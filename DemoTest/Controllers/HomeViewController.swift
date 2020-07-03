//
//  HomeViewController.swift
//  DemoTest
//
//  Created by Israrul on 6/30/20.
//  Copyright © 2020 Israrul Haque. All rights reserved.
//

import Foundation
import UIKit

protocol HomeViewControllerProtocol:class {
    func refreshUI()
    func refreshTablView(for indexPath:IndexPath)
}

final class HomeViewController: UIViewController {

    var homeViewModel:HomeViewModel<Service<FeatureCollectionResult>>?
    var tableView:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        homeViewModel = HomeViewModel(homeViewControllerProtocol: self, service:Service())
        homeViewModel?.getFeatureResults()
        navigationItem.title = "USGS Earthquakes"
        configureUI()
    }
    
    fileprivate func configureUI() {
    
        tableView = UITableView()
        if let tableView = tableView {
            
            self.view.addSubview(tableView)

            tableView.register(HomeTableViewCell.self, forCellReuseIdentifier:"cell")
            tableView.dataSource = self
            tableView.delegate = self
            
            tableView.translatesAutoresizingMaskIntoConstraints = false
            UIView.setConstraints(for:tableView, toParent: self.view)
        }
    }
    
    fileprivate func moveToDetailVC(for indexPath:IndexPath) {
        let detailsViewCtrl = DetailsViewController()
               self.navigationController?.pushViewController(detailsViewCtrl, animated: true)
        detailsViewCtrl.viewModel = DetailViewModel(feature:homeViewModel?.getFeature(at: indexPath.row), detailViewCtrl: detailsViewCtrl)
    }
}


extension HomeViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let homeViewModel = homeViewModel else {
            return 0
        }
        return homeViewModel.getNumberOfFeatures()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for:indexPath) as! HomeTableViewCell
        
        cell.accessoryType = UITableViewCell.AccessoryType.disclosureIndicator

        if let homeViewModel = homeViewModel {
            cell.titleLbl.text = homeViewModel.getFeatureTitle(at: indexPath.row)
            cell.nameLbl.text = homeViewModel.getFeatureType(at: indexPath.row)
         //   cell.magLbl.text = homeViewModel.getMag(at: indexPath.row)
            cell.magTypeLbl.text = homeViewModel.getMagType(at: indexPath.row)
            cell.placeLbl.text = homeViewModel.getPlace(at: indexPath.row)
            cell.timeLbl.text = homeViewModel.getTime(at: indexPath.row)
            cell.albumImageView.text = homeViewModel.getMag(at: indexPath.row)
        }else {
            cell.titleLbl.text = ""
            cell.nameLbl.text = ""
        }
        return cell
    }
}


extension HomeViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
    internal func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.moveToDetailVC(for: indexPath)
    }
}

extension HomeViewController:HomeViewControllerProtocol {
    func refreshUI() {
        tableView?.reloadData()
    }
    func refreshTablView(for indexPath:IndexPath) {
        tableView?.reloadRows(at:[indexPath], with: UITableView.RowAnimation.automatic)
    }
}

