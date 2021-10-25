import Alamofire
import UIKit

class PhotoTableViewController: UITableViewController, Coordinating {
    
    var coordinator: Coordinator?

    let photoViewModel = PhotoViewModel()
    
    var albumId: Int?
    var userName: String?
    var photos = [Photo]()
    
    init(albumId: Int, userName: String) {
        self.albumId = albumId
        self.userName = userName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Fotos de \(userName!)"
        
        tableView.dataSource = self
        tableView.register(PhotoTableViewCell.self, forCellReuseIdentifier: "PhotoCell")
        tableView.rowHeight = 173
        
        photoViewModel.fillPhotos(from: albumId!, completion: { data in
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
                self.coordinator?.goToDetails(photo: UIImage(data: data)!, name: photo.title)
            default:
                break
            }
        }
    }
}

