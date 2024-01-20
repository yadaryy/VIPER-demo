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
    var presenter : CoinListPresentationLogic?
    var viewModel: [CoinList]?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        presenter?.notifyViewLoaded()
    }
    
    override func viewWillAppear(_ animated: Bool) {
          super.viewWillAppear(animated)
        presenter?.notifyViewWillAppear()
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
    
    
    func reloadData() {
        self.tableView.reloadData()
    }
    
    func setScreenTitle(with title: String) {
        self.title = title
    }
    
    private func setup(){
      let view = self
      let interactor = CoinListInteractor()
      let presenter = CoinListPresenter()
        
      presenter.interactor = interactor
      presenter.view = view
      interactor.presenter = presenter
      view.presenter = presenter
    }
}

extension CoinListViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: CoinListTableViewCell.identifier, for: indexPath) as! CoinListTableViewCell
        
        cell.coinName.text = viewModel?[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
     }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       return()
     }
    
}
