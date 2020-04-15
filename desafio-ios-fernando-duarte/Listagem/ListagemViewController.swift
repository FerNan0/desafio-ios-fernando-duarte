//
//  ListagemViewController.swift
//  desafio-ios-fernando-duarte
//
//  Created by Fernando F Duarte on 15/04/20.
//  Copyright © 2020 Fernando F Duarte. All rights reserved.
//

import UIKit

class ListagemViewController: UIViewController {
    
    @IBOutlet weak var tbvContent: UITableView!
    var interactor: ListagemInteractor?
    var presenter: ListagemPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupUI()        
    }
     override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(animated)
     }
     
     func setupUI() {
         tbvContent.delegate = self
         tbvContent.dataSource = self
         tbvContent.tableFooterView = UIView()
//         self.tbvContent.register(UINib(nibName: "PostListCell", bundle: nil), forCellReuseIdentifier: "postListCell")
     }
     
     func reload() {
         self.tbvContent.reloadData()
     }
     
     func setup() {
         let viewController = self
         let presenter = ListagemPresenter()
         let interactor = ListagemInteractor()
         viewController.interactor = interactor
         
         doRequestDefault(url: baseURL.teste.rawValue)
     }
     
     func doRequestDefault(url: String) {
         interactor?.request(method: url, completion: { data in
             OperationQueue.main.addOperation {
                 let decoder = JSONDecoder()
                 do {
//                     let customer = try decoder.decode(ResponseListagemDefault.self, from: data)
//                     self.objDefault = customer
                 } catch {
                     print(error.localizedDescription)
                 }
                 self.reload()
             }
         })
     }
}

extension ListagemViewController: UITableViewDelegate, UITableViewDataSource {
func numberOfSections(in tableView: UITableView) -> Int {
    return 1
}
func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "listCell") //as? ListCell
//    let dados = self.objDefault?.dados![indexPath.row]
    //cell?.interactor = (self.interactor!)
    cell?.selectionStyle = .none

    return cell ?? UITableViewCell()
}

func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 120
}

func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//    let vc = DetailViewController(nibName: "DetailViewController", bundle: nil) as DetailViewController
//    vc.id = objDefault?.dados![indexPath.row].id
//    self.navigationController?.pushViewController(vc, animated: true)
}
}
