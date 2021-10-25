import Alamofire
import UIKit

class PostTableViewController: UITableViewController, Coordinating {
    
    var coordinator: Coordinator?    

    let postViewModel = PostViewModel()
    
    var userId: Int?
    var userName: String?
    var posts = [Post]()
    
    init(userId: Int, userName: String) {
        self.userId = userId
        self.userName = userName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Postagens de \(userName!)"
        
        tableView.dataSource = self
        tableView.register(TitleAndDescriptionTableViewCell.self, forCellReuseIdentifier: "TitleAndDescriptionCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        
        postViewModel.fillPosts(from: userId!, completion: { data in
            self.posts = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - TableView DataSource

extension PostTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TitleAndDescriptionCell", for: indexPath) as! TitleAndDescriptionTableViewCell

        let post = posts[indexPath.row]
        cell.titleLabel.text = post.title
        cell.descriptionLabel.text = post.body

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let postId = posts[indexPath.row].id
        let userName = self.userName
//        performSegue(withIdentifier: "postToComment", sender: postId)
        coordinator?.goToComments(postId: postId, userName: userName!)
    }
}

// MARK: - Navigation

extension PostTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatoinVC = segue.destination as? CommentTableViewController {
            if let postId = sender as? Int {
                destinatoinVC.userName = userName!
                destinatoinVC.postId = postId
            }
        }
    }
}
