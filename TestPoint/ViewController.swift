//
//  ViewController.swift
//  TestPoint
//
//  Created by Nafis Shayakbarov on 05/06/2018.
//  Copyright © 2018 Nafis Shayakbarov. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UISearchResultsUpdating {

    // MARK: - Private types
    
    struct NewsData: Decodable {
        let status: String
        let totalResults: Int
        let articles: [Article]
    }
    
    struct Article: Decodable {
        var author: String?
        var description: String?
        var urlToImage: String?
    } 
    
    // MARK: - Private constants
    
    private let urlString = "https://newsapi.org/v2/everything?q=bitcoin&apiKey=d2adc8cb42a94aefb649fc5e0ca177b6"
    private let cellIdentifier = "cell"
    
    // MARK: - Public Properties
    
    private let tableView = UITableView()
    let searchController = UISearchController(searchResultsController: nil)

    var newsList = [News]()
    var filteredData = [News]()

    override func viewDidLoad() {
        super .viewDidLoad()

        deleteAllCoreData()
        getDataFromAPI()

        setupUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getDataCore()
    }

    // MARK: - Setup UI
    
    private func setupUI() {
        
        self.title = "News Review"
        
        searchController.searchBar.placeholder = "Search by author"
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        tableView.tableHeaderView = searchController.searchBar
        
        tableView.estimatedRowHeight = 44.0
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.dataSource = self
        tableView.register(NewsTableViewCell.self, forCellReuseIdentifier: "cell")
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    // MARK: - A function of getting data from CoreData
    
    func getDataCore() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = News.fetchRequest() as NSFetchRequest<News>
        let sortDescriptor = NSSortDescriptor(key: "author", ascending: true)
        request.sortDescriptors = [sortDescriptor]
        
        do {
            newsList = try context.fetch(request)
            filteredData = newsList
        } catch let error{
            print("Error: ", error)
        }
        self.tableView.reloadData()
    }
    
    // MARK: - A function of getting data from API
    
    func getDataFromAPI() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        
        guard let url = URL(string: urlString) else {
            return
        }
        
        let semaphore = DispatchSemaphore(value: 0)

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            guard let data = data else {
                return
            }
            
            do {
                let newsData = try JSONDecoder().decode(NewsData.self, from: data)
                
                for article in newsData.articles {
                    let newNews = News(context: context)
                    newNews.author = article.author ?? "Without the author" as String
                    newNews.descriptionNews = article.description ?? "Without the description" as String
                    newNews.url = article.urlToImage ?? "Without the link to image" as String
                }
                
                try context.save()
                
                semaphore.signal()
            } catch let error {
                print("Error: ", error)
            }
        }.resume()
        semaphore.wait()
    }

    // MARK: - A function of deleting data from CoreData
    
    func deleteAllCoreData() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let request = News.fetchRequest() as NSFetchRequest<News>
        
        do
        {
            let results = try context.fetch(request)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject
                context.delete(managedObjectData)
            }
        } catch let error {
            print("Error: ", error)
        }
    }

    // MARK: - A function of updating results of search
    
    func updateSearchResults(for searchController: UISearchController) {
        if searchController.searchBar.text! == "" {
            filteredData = newsList
        } else {
            filteredData = newsList.filter { ($0.author?.lowercased().contains(searchController.searchBar.text!.lowercased()))! }
        }
        self.tableView.reloadData()
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsTableViewCell
        cell.authorLabel.text = self.filteredData[indexPath.row].author
        cell.descriptionText.text = self.filteredData[indexPath.row].descriptionNews
        cell.urlToImg.text = self.filteredData[indexPath.row].url
        return cell
    }
}
