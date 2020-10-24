import Foundation
struct NewsListVM {
    let articles: [NewsModel]
}
extension NewsListVM {
    var numberOfSections: Int {
        return 1
    }
    func numberOfRowsInSection(_ section: Int)-> Int {
         return self.articles.count  
    }
    func articleAtIndex(_ index: Int) -> NewsVM {
        let article = self.articles[index]
        return NewsVM(article)
    }
}

struct NewsVM {
    private let article: NewsModel
    init(_ article: NewsModel) {
        self.article = article
    }
}

extension NewsVM {
    var title: String  {
        return self.article.title
    }
    var description : String {
        return self.article.description
    }
    var publishedAt: String  {
        return self.article.publishedAt
    }
    var content : String {
        return self.article.content
    }
}

