import UIKit

class DetailsViewController: UIViewController, Coordinating {
    
    var coordinator: Coordinator?
    
    var detailImageView: UIImageView = .detailPhotoImageView()
    var nameLabel: UILabel = .regularLabel(17, textColor: .black, numberOfLines: 0)
    
    var photo: UIImage?
    var name: String?
    
    init(photo: UIImage, name: String) {
        self.photo = photo
        self.name = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UINavigationBar.appearance().isTranslucent = true
        navigationItem.title = "Detalhes"
        
        view.backgroundColor = .white
        
        detailImageView.image = photo
        nameLabel.text = name
        
        view.addSubview(detailImageView)
        view.addSubview(nameLabel)
        
        setDetailImageViewConstraints()
        setNameLabelConstraints()
    }
}

// MARK: - Constraints

extension DetailsViewController {
    
    func setDetailImageViewConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        detailImageView.translatesAutoresizingMaskIntoConstraints = false
        detailImageView.topAnchor.constraint(equalTo: guide.topAnchor, constant: 16).isActive = true
        detailImageView.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 24).isActive = true
        detailImageView.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -24).isActive = true
        detailImageView.heightAnchor.constraint(equalToConstant: 250).isActive = true
    }

    func setNameLabelConstraints() {
        let guide = self.view.safeAreaLayoutGuide
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: detailImageView.bottomAnchor, constant: 16).isActive = true
        nameLabel.leadingAnchor.constraint(equalTo: guide.leadingAnchor, constant: 24).isActive = true
        nameLabel.trailingAnchor.constraint(equalTo: guide.trailingAnchor, constant: -24).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 366).isActive = true
        
    }
}
