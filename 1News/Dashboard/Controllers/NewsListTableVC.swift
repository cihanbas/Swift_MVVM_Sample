

import SnapKit
import UIKit
class NewsVC: UIViewController {
    var tableView = UITableView()
    private var newsListVM : NewsListVM!
    override func viewDidLoad() {
        super.viewDidLoad()
         title = "NEWS"
        configureTableView()
        setupDelegate()
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=0a911bd124a440ca9b86422555c35a15")!
        WebServices().getArticles(url: url) { (model) in
            if let articles = model {
                self.newsListVM = NewsListVM(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
           
        }
    }
    func configureTableView()  {
        view.backgroundColor = .white
        self.navigationController?.navigationBar.prefersLargeTitles = true 
        
        view.addSubview(tableView)
         tableView.rowHeight = 190
        tableView.snp.makeConstraints { (make) in
            make.width.equalToSuperview().inset(10)
            make.height.equalToSuperview()
            make.top.equalToSuperview()
            
            make.left.equalToSuperview().inset(10)
        }
    }
    func setupDelegate(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(NewsCell.self, forCellReuseIdentifier: "NewsCell")
    }
}

extension NewsVC: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return self.newsListVM.numberOfRowsInSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as? NewsCell
      
        let model = self.newsListVM.articleAtIndex(indexPath.row)
  
        cell?.set(model: model)
        return cell!
    }
     func numberOfSections(in tableView: UITableView) -> Int {
        return self.newsListVM == nil ? 0 : self.newsListVM.numberOfSections
    }
    
    
}
