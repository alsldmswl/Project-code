//
//  BeerListViewController.swift
//  Brewery
//
//  Created by eun-ji on 2023/03/26.
//

import UIKit

class BeerListViewController: UITableViewController {
    
    var beerList = [Beer]()
    var dataTasks = [URLSessionDataTask] ()
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Brewery"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        // uitable view 설정
        tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        tableView.rowHeight = 150
        tableView.prefetchDataSource = self
        
        fetchBeer(of: currentPage)
    }
}

extension BeerListViewController: UITableViewDataSourcePrefetching {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as! BeerListCell
        
        let beer = beerList[indexPath.row]
        cell.configure(with: beer)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        
        let detailViewController = BeerDetailViewController()
        detailViewController.beer = selectedBeer
        
        self.show(detailViewController, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        guard currentPage != 1 else {return}
        indexPaths.forEach{
            if ($0.row + 1)/25 + 1 == currentPage {
                self.fetchBeer(of: currentPage)
            }
        }
    }
}

private extension BeerListViewController {
    func fetchBeer(of page: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)"), dataTasks.firstIndex(where: { task in
            task.originalRequest?.url == url}) == nil
        else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard error == nil,
                  let self = self,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let beers = try? JSONDecoder().decode([Beer].self, from: data) else {
                print("-->> error: urlsession data task \(error?.localizedDescription)")
                return
            }
            switch response.statusCode {
            case (200..<300):
                self.beerList += beers
                self.currentPage += 1
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case (400..<500):
                print("error: Client error \(response.statusCode), response: \(response)")
            case (500..<600):
                print("error: Server error \(response.statusCode), response: \(response)")
            default:
                print("error: \(response.statusCode), response: \(response)")
            }
        }
        dataTask.resume()
        dataTasks.append(dataTask)
        
    }
}
