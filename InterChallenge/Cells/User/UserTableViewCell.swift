import UIKit

protocol UserTableViewCellDelegate: AnyObject {
    func didTapAlbums(with userId: Int, by name: String)
    func didTapPosts(with userId: Int, by name: String)
}

class UserTableViewCell: UITableViewCell {
    
    var id: Int = 0
    var delegate: UserTableViewCellDelegate?
    
    var initialsLabel: UILabel = .regularLabelWithBackground(17.0, textColor: .black, numberOfLines: 1, backgroundColor: .systemYellow)
    var nameLabel: UILabel = .regularLabel(17.0, textColor: .black, numberOfLines: 0)
    var userNameLabel: UILabel = .regularLabel(17.0, textColor: .black, numberOfLines: 1)
    var emailLabel: UILabel = .regularLabel(17.0, textColor: .black, numberOfLines: 1)
    var phoneLabel: UILabel = .regularLabel(17.0, textColor: .black, numberOfLines: 1)
    var separatorView: UIView = .separatorView(heigth: 157, width: 2)
    var albumsButton: UIButton = .userCellButton(title: "ÁLBUNS")
    var postsButton: UIButton = .userCellButton(title: "POSTAGENS")
    
    // MARK: - Initializes Cell
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

        addSubview(initialsLabel)
        addSubview(nameLabel)
        addSubview(separatorView)
        addSubview(userNameLabel)
        addSubview(emailLabel)
        addSubview(phoneLabel)
    
        setInitialsLabelConstraints()
        setNameLabelConstraints()
        setSeparatorConstraints()
        setUserNameLabelConstraints()
        setEmailLabelConstraints()
        setPhoneLabelConstraints()
        
        //Configures Button StackView
        let stackView = UIStackView(arrangedSubviews: [UIView(), albumsButton, UIView(), postsButton, UIView()])
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        contentView.addSubview(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.topAnchor.constraint(equalTo: separatorView.bottomAnchor, constant: 24).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8).isActive = true
        
        albumsButton.addTarget(self, action: #selector(albumsAction), for: .touchUpInside)
        postsButton.addTarget(self, action: #selector(postsAction), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Actions
    
    @objc func albumsAction() {
        print("albums")
        delegate?.didTapAlbums(with: id, by: nameLabel.text ?? "")
    }
    
    @objc func postsAction() {
        print("posts")
        delegate?.didTapPosts(with: id, by: nameLabel.text ?? "")
    }

    // MARK: - Constraints
    
    func setInitialsLabelConstraints() { //initialsLabel
        initialsLabel.translatesAutoresizingMaskIntoConstraints = false
        initialsLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        initialsLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        initialsLabel.widthAnchor.constraint(equalToConstant: 88).isActive = true
        initialsLabel.heightAnchor.constraint(equalToConstant: 88).isActive = true
    }
    
    func setNameLabelConstraints() { //nameLabel
        nameLabel.textAlignment = .center
        nameLabel.lineBreakMode = .byWordWrapping
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: initialsLabel.bottomAnchor, constant: 16).isActive = true
        nameLabel.centerXAnchor.constraint(equalTo: initialsLabel.centerXAnchor).isActive = true
        nameLabel.widthAnchor.constraint(equalToConstant: 92).isActive = true

    }
    
    func setSeparatorConstraints() { //separatorView
        separatorView.translatesAutoresizingMaskIntoConstraints = false
        separatorView.topAnchor.constraint(equalTo: topAnchor, constant: 8).isActive = true
        separatorView.leadingAnchor.constraint(equalTo: initialsLabel.trailingAnchor, constant: 32).isActive = true
        separatorView.heightAnchor.constraint(equalToConstant: 157).isActive = true
        separatorView.widthAnchor.constraint(equalToConstant: 2).isActive = true
    }
    
    func setUserNameLabelConstraints() { //usernameLabel
        userNameLabel.textAlignment = .left
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        userNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16).isActive = true
        userNameLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        userNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        userNameLabel.heightAnchor.constraint(equalToConstant: 20.33).isActive = true
    
    }
    
    func setEmailLabelConstraints() { //emailLabel
        emailLabel.textAlignment = .left
        emailLabel.lineBreakMode = .byWordWrapping
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 24).isActive = true
        emailLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        emailLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        emailLabel.heightAnchor.constraint(equalToConstant: 20.33).isActive = true
    }
    
    func setPhoneLabelConstraints() { //phoneLabel
        phoneLabel.textAlignment = .left
        phoneLabel.lineBreakMode = .byWordWrapping
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 24).isActive = true
        phoneLabel.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 16).isActive = true
        phoneLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 16).isActive = true
        phoneLabel.heightAnchor.constraint(equalToConstant: 20.33).isActive = true
    }
}

