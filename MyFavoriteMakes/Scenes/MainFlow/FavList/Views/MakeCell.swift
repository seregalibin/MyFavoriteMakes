//
//  MakeCell.swift
//  MyFavoriteMakes
//
//  Created by Sergey Libin on 13.07.2022.
//

import Foundation
import UIKit

final class MakeCell: UITableViewCell {
    
    static let reuseIdentifier = "MakeCell"
    
    private var favoriteChanged: ((Bool) -> Void)?
    private var isFavorite: Bool = false {
        didSet {
            favoriteImageView.image = isFavorite ? UIImage(systemName: "heart.fill") : UIImage(systemName: "heart")
        }
    }
    
    private let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = .systemFont(ofSize: 20)
        lbl.numberOfLines = 1
        lbl.textColor = .black
        return lbl
    }()
    
    private let favoriteImageView: UIImageView = {
        let favSwitch = UIImageView()
        favSwitch.tintColor = .red
        return favSwitch
    }()
    
    // MARK: Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupViews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(model: MakeModel, favoriteChanged: ((Bool) -> Void)?) {
        self.favoriteChanged = favoriteChanged
        
        titleLabel.text = model.name
        isFavorite = model.isFavorite
    }
    
    // MARK: Configuration
    private func setupViews() {
        self.selectionStyle = .none

        [titleLabel, favoriteImageView].forEach(contentView.addSubview)

        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(favoriteTapped))
        contentView.addGestureRecognizer(tapRecognizer)
    }
    
    private func setupConstraints() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
        
        favoriteImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            favoriteImageView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            favoriteImageView.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            favoriteImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
        ])
    }
    
    @objc
    private func favoriteTapped() {
        isFavorite.toggle()
        favoriteChanged?(isFavorite)
    }
}
