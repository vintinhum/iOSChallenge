import Alamofire
import UIKit

class AlbumTableViewController: UITableViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    let albumViewModel = AlbumViewModel()
    
    var userId: Int?
    var userName: String?
    var albums = [Album]()
    
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
        
        navigationItem.title = "Álbuns de \(userName!)"
        
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        tableView.rowHeight = 44
        
        albumViewModel.fillAlbums(from: userId!, completion: { data in
            self.albums = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - TableView DataSource

extension AlbumTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as! AlbumTableViewCell
        
        let album = albums[indexPath.row]
        cell.albumNameLabel.text = album.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let albumId = albums[indexPath.row].id
        let userName = self.userName
        coordinator?.goToPhotos(albumId: albumId, userName: userName!)
    }
}


