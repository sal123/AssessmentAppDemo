//
//  ViewController.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
import SwiftyJSON
class HomeViewController: UIViewController {
    
    var models:[MostViewModel] = [MostViewModel]()
    var mostviewService = MostViewService()
    @IBOutlet weak var TableView: UITableView!
    var activityIndicator : UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
        self.title = "NY Times Most Popular"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getData(){
        activityIndicator = UIActivityIndicatorView(frame: self.view.frame)
        activityIndicator?.style = .whiteLarge
        activityIndicator?.color = UIColor.black
        self.view.addSubview(activityIndicator!)
        
        activityIndicator?.startAnimating()
        
        mostviewService.getMostViewData(section: "all-sections", timePeriod: "7",completionHandler: { [weak self](success, response) in
            if success{
                for result in response["results"].arrayValue {
                    let model = MostViewModel()
                    NYTIMESManager.sharedInstance.utility.setup(dictObject: result, object: model)
                    self?.models.append(model)
                }
                
                self?.models = (self?.models.sorted{ $0.published_date < $1.published_date})!
                self?.TableView.reloadData()
            }
            self?.activityIndicator?.stopAnimating()
            
        })
        
    }
    
}

extension HomeViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let controller:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "DetailViewController") as? DetailViewController  else{
            return
        }
        controller.url = self.models[indexPath.row].url
        self.navigationController?.pushViewController(controller, animated: true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HeadLineCell") as! HeadlineCell
        cell.setup(model: self.models[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.models.count
    }
    
}

