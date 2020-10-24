import UIKit
class NewsCell: UITableViewCell {
    var title: UILabel = {
        var label = UILabel()
        label.text = "Cihan BAS"
        label.font = .boldSystemFont(ofSize: 21)
        label.numberOfLines = 2
        return label
    }()
    var desc: UILabel = {
        var label = UILabel()
        label.text = "Cihan BAS"
        label.numberOfLines = 5
        
        label.font = .boldSystemFont(ofSize: 15)
        return label
    }()
    var author: UILabel = {
        var label = UILabel()
        label.text = "Cihan BAS"
        label.font = .boldSystemFont(ofSize: 13)
        label.numberOfLines = 1
        return label
    }()
    var publishedAt: UILabel = {
        var label = UILabel()
        label.text = "Cihan BAS"
        label.font = .boldSystemFont(ofSize: 13)
        label.numberOfLines = 1
        return label
    }()
    var stackV : UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .leading
        stack.distribution = .equalCentering
        
        return stack
    }()
 
    let stackH : UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .center
        stack.distribution = .equalSpacing
        
        return stack
    }()
    let container : UIView = {
        var view = UIView()
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    func set(model: NewsVM)  {
        stackV.addArrangedSubview(title)
        stackV.addArrangedSubview(desc)
        stackV.addArrangedSubview(stackH)
        stackH.addArrangedSubview(author)
        stackH.addArrangedSubview(publishedAt)

        title.text =  model.title
        let dateString = model.publishedAt
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssXXXXX"
        if let date = formatter.date(from: dateString) {
            formatter.dateFormat = "yyyy-MM-dd"
            let string = formatter.string(from: date)
            publishedAt.text =   string
        }
        desc.text =  model.description
        author.text =  model.content
        container.addSubview(stackV)
        addSubview(container)
        container.snp.makeConstraints { (make) in
            make.height.equalToSuperview().inset(10)
            make.width.equalToSuperview().inset(10)
            make.center.equalToSuperview()
            
        }
        stackV.snp.makeConstraints { (make) in
            make.height.width.equalToSuperview()
        }
        stackH.snp.makeConstraints { (make) in
            make.height.equalTo(30)
 
        }
        author.snp.makeConstraints { (make) in
            make.left.equalToSuperview()
            make.bottom.equalToSuperview()
            
            make.width.lessThanOrEqualToSuperview()
        }
        publishedAt.snp.makeConstraints { (make) in
            make.right.equalToSuperview()
            make.bottom.equalToSuperview()
            make.width.lessThanOrEqualToSuperview()

        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
