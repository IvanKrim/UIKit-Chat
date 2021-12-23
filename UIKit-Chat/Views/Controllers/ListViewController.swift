//
//  ListViewController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 21.12.2021.
//

import UIKit

struct MChat: Hashable {
    var userName: String
    var userImage: UIImage
    var lastMessage: String
    var id = UUID()
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
    // apple: 220  Advances in UI Data Sources
}

class ListViewController: UIViewController {
    let activeChats: [MChat] = [
        MChat(userName: "Ivan", userImage: UIImage(named: "human1")!, lastMessage: "How are you?"),
        MChat(userName: "Krimus", userImage: UIImage(named: "human2")!, lastMessage: "Hello"),
        MChat(userName: "Ivan", userImage: UIImage(named: "human3")!, lastMessage: "How are you?"),
        MChat(userName: "Krimus", userImage: UIImage(named: "human4")!, lastMessage: "Hello")
    ]
    
    var collectionView: UICollectionView!
    
    enum Section: Int, CaseIterable {
        case activeChats
    }
    
    var dataSourse: UICollectionViewDiffableDataSource<Section, MChat>? // объект типа секции, объект параметров секции
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupSearchBar()
        
        createDataSource()
        reloadData()
    }
    
    private func setupSearchBar() {
        let searchController = UISearchController(searchResultsController: nil)
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
    }
    
    private func setupCollectionView() {
        collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: createCompositionLayout()) //CompositionLayout
        collectionView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        collectionView.backgroundColor = .mainWhite()
        view.addSubview(collectionView)
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellID")
    }
    
    private func createDataSource() {
        dataSourse = UICollectionViewDiffableDataSource<Section, MChat>(collectionView: collectionView, cellProvider: { collectionView, indexPath, chat in
            guard let section = Section(rawValue: indexPath.section) else {
                fatalError("Unknown section kind")
            }
            switch section {
            case .activeChats:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID", for: indexPath)
                cell.backgroundColor = .systemBlue
                return cell
            }
        })
    }
    
    private func reloadData() { // добавляем реальные данные
        var snapShot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapShot.appendSections([.activeChats])
        snapShot.appendItems(activeChats, toSection: .activeChats)
        
        dataSourse?.apply(snapShot, animatingDifferences: true)
    }
    
    // MARK: - CompositionLayout
    private func createCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            // layout = section -> group -> items -> size
            //задаем размеры item
            let itemSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            )
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            
            let groupSize = NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(84)
            )
            let group = NSCollectionLayoutGroup.vertical(
                layoutSize: groupSize,
                subitems: [item]
            )
            // конфигурация элементов внутри секции
            group.contentInsets = NSDirectionalEdgeInsets.init(
                top: 0, leading: 0, bottom: 8, trailing: 0
            )
            
            let section = NSCollectionLayoutSection(group: group)
            // конфигурация размеров(отступов) всей секции
            section.contentInsets = NSDirectionalEdgeInsets.init(
                top: 16, leading: 20, bottom: 0, trailing: 20
            )
            
            return section
        }
        return layout
    }
}



// MARK: - UISearchBarDelegate
// настраиваем отображение вводимого текста в searchBar
extension ListViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}



// MARK: - SwiftUI
import SwiftUI

struct ListVCProvider: PreviewProvider {
    static var previews: some View {
        Group {
            ContainerView().edgesIgnoringSafeArea(.all)
        }
    }
    
    struct ContainerView: UIViewControllerRepresentable {
        let tabBarVC = MainTabBarController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) -> MainTabBarController {
            return tabBarVC
        }
        
        func updateUIViewController(_ uiViewController: ListVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<ListVCProvider.ContainerView>) {
        }
    }
}
