import Alamofire
import UIKit

class ChallengeViewController: UITableViewController, Coordinating {
    
    var coordinator: Coordinator?

    let userViewModel = UserViewModel()
    
    var users = [User]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        tableView.dataSource = self
        tableView.register(UserTableViewCell.self, forCellReuseIdentifier: "UserCell")
        tableView.rowHeight = 233
        
        userViewModel.fillUsers { data in
            self.users = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableView DataSource

extension ChallengeViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as! UserTableViewCell
        
        let user = users[indexPath.row]
        cell.selectionStyle = .none
        cell.id = user.id

        cell.initialsLabel.text = String(user.name.prefix(2))
        cell.nameLabel.text = user.name
        cell.userNameLabel.text = user.username
        cell.emailLabel.text = user.email
        cell.phoneLabel.text = user.phone
        cell.delegate = self
        cell.backgroundColor = indexPath.row % 2 == 0 ? .white : UIColor(white: 0.667, alpha: 0.2)
        return cell
    }
}

// MARK: - Navigation

extension ChallengeViewController: UserTableViewCellDelegate {
    
    func didTapAlbums(with userId: Int, by name: String) {
        coordinator?.goToAlbums(userId: userId, userName: name)
    }
    
    func didTapPosts(with userId: Int, by name: String) {
        coordinator?.goToPosts(userId: userId, userName: name)
    }
}
