//
//  CoinListViewController.swift
//  VIPER Demo
//
//  Created by Yadar Tulayathamrong on 18/1/2567 BE.
//

import Foundation
import UIKit
import SVProgressHUD

class CoinListViewController: UIViewController{
    var presenter : CoinListPresenter?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.notifyViewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        self.presenter?.notifyViewWillAppear()
      }
}



extension CoinListViewController : CoinListDisplayLogic {
    func setupInitialView() {
        let bundle = Bundle(for: CoinListTableViewCell.self)
        
        self.tableView.register(
            UINib(nibName: CoinListTableViewCell.identifier,bundle:bundle),
            forCellReuseIdentifier: CoinListTableViewCell.identifier
        )
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    func showLoading() {
        SVProgressHUD.show()
    }
    
    func hideLoading() {
        SVProgressHUD.dismiss()
    }
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func setScreenTitle(with title: String) {
        self.title = title
    }
}

extension CoinListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.presenter?.getViewModel()?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinListTableViewCell.identifier, for: indexPath) as! CoinListTableViewCell
        
        let viewModel = self.presenter?.getViewModel()![indexPath.row]
        cell.coinName.text = viewModel?.name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       return()
     }
    
}
