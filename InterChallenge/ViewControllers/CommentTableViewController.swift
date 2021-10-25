import Alamofire
import UIKit

class CommentTableViewController: UITableViewController, Coordinating {

    var coordinator: Coordinator?
    
    let commentViewModel = CommentViewModel()
    
    var userName: String?
    var postId: Int?
    var comments = [Comment]()
    
    init(userName: String, postId: Int) {
        self.userName = userName
        self.postId = postId
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Comentários de \(userName!)"
        
        tableView.dataSource = self
        tableView.register(TitleAndDescriptionTableViewCell.self, forCellReuseIdentifier: "TitleAndDescriptionCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        commentViewModel.fillComments(from: postId!, completion: { data in
            self.comments = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - TableView DataSource

extension CommentTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comments.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as! TitleAndDescriptionTableViewCell

        let comment = comments[indexPath.row]
        cell.selectionStyle = .none
        cell.titleLabel.text = comment.name
        cell.descriptionLabel.text = comment.body

        return cell
    }
}
