import UIKit

class AlbumTableViewCell: UITableViewCell {

    var albumNameLabel: UILabel = .regularLabel(17, textColor: .black, numberOfLines: 1)
    
    // MARK: - Initializes Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(albumNameLabel)
        setAlbumNameLabelConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Constraints
    
    func setAlbumNameLabelConstraints() {
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        albumNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
    }
    
}
