import Alamofire
import UIKit

class PhotoTableViewController: UITableViewController {

    let photoViewModel = PhotoViewModel()
    
    var albumId = Int()
    var userName = String()
    var photos = [Photo]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Fotos de \(userName)"
        
        tableView.dataSource = self
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.rowHeight = 173
        
        photoViewModel.fillPhotos(from: albumId, completion: { data in
            self.photos = data
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
}

// MARK: - TableView DataSource

extension PhotoTableViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PhotoCell", for: indexPath) as! PhotoTableViewCell

        let photo = photos[indexPath.row]
        cell.titleLabel.text = photo.title

        AF.download(photo.thumbnailUrl).responseData { response in
            switch response.result {
            case .success(let data):
                cell.photoImageView.image = UIImage(data: data)
            default:
                break
            }
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let photo = photos[indexPath.row]
        AF.download(photo.url).responseData { response in
            switch response.result {
            case .success(let data):
                self.performSegue(withIdentifier: "photoToDetail",
                                  sender: (photo: UIImage(data: data), name: photo.title))
            default:
                break
            }
        }
    }
}

// MARK: - Navigation

extension PhotoTableViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destinatinVC = segue.destination as? DetailsViewController {
            if let info = sender as? (photo: UIImage, name: String) {
                destinatinVC.photo = info.photo
                destinatinVC.name = info.name
            }
        }
    }
}
