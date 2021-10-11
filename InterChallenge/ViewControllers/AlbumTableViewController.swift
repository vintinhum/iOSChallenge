import Alamofire
import UIKit

class AlbumTableViewController: UITableViewController {

    let albumViewModel = AlbumViewModel()
    
    var userId = Int()
    var userName = String()
    var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Álbuns de \(userName)"
        
        tableView.dataSource = self
        tableView.register(AlbumTableViewCell.self, forCellReuseIdentifier: "AlbumCell")
        tableView.rowHeight = 44
        
        albumViewModel.fillAlbums(from: userId, completion: { data in
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
        performSegue(withIdentifier: "albumToPhoto", sender: albumId)
    }
}

// MARK: - Navigation

extension AlbumTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatoinVC = segue.destination as? PhotoTableViewController {
            if let albumId = sender as? Int {
                destinatoinVC.userName = userName
                destinatoinVC.albumId = albumId
            }
        }
    }
}
