//
//  ViewController.swift
//  OlympicsMedalBoard
//
//  Created by Pratyusha Joginipally on 8/2/24.
//

import UIKit

class ViewController: UIViewController {

  private let session = ContentService()
  var medals = [Medals]()
  var tableView = UITableView()

  override func viewDidLoad() {
    super.viewDidLoad()
    navigationController?.navigationBar.prefersLargeTitles = true
    configureTableView()
  }

  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    fetchMedalData()
  }

  func fetchMedalData() {
    session.getMedalData { [weak self] medals in
      guard let self = self else { return }

      self.medals = medals.medalsCount
      DispatchQueue.main.async {
        self.tableView.reloadData()
      }
    }
  }

  func configureTableView() {
    view.addSubview(tableView)
    tableView.frame = view.bounds
    tableView.layer.cornerRadius = 8
    tableView.layoutMargins = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    tableView.separatorInset = .zero
    tableView.translatesAutoresizingMaskIntoConstraints = false
    tableView.dataSource = self
    tableView.register(MedalCell.self, forCellReuseIdentifier: MedalCell.reuseId)
  }
}

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return medals.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: MedalCell.reuseId, for: indexPath) as! MedalCell
    let item = medals[indexPath.row]
    cell.setupCell(item)
    cell.layoutMargins = .zero
    return cell
  }


}

