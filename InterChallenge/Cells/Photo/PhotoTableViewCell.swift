import UIKit

class PhotoTableViewCell: UITableViewCell {
    
    var photoImageView: UIImageView = .photoCellImageView()
    var titleLabel: UILabel = .regularLabel(17, textColor: .black, numberOfLines: 0)

    // MARK: - Initializes Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(photoImageView)
        addSubview(titleLabel)
        
        setPhotoImageViewConstraints()
        setTitleLableConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    func setPhotoImageViewConstraints() {
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        photoImageView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        photoImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        photoImageView.widthAnchor.constraint(equalToConstant: 150).isActive = true
        photoImageView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        
    }
    
    func setTitleLableConstraints() {
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 60).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: photoImageView.trailingAnchor, constant: 16).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        titleLabel.widthAnchor.constraint(equalToConstant: 347).isActive = true
    }

    
}
