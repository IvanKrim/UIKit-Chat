//
//  ListViewController.swift
//  UIKit-Chat
//
//  Created by Kalabishka Ivan on 21.12.2021.
//

import UIKit

struct MChat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: MChat, rhs: MChat) -> Bool {
        return lhs.id == rhs.id
    }
    // apple: 220  Advances in UI Data Sources изучить
}

class ListViewController: UIViewController {
    let activeChats = Bundle.main.decode([MChat].self, from: "activeChats.json")
    let waitingChats = Bundle.main.decode([MChat].self, from: "waitingChats.json")
    
    var collectionView: UICollectionView!
    
    enum Section: Int, CaseIterable {
        case waitingChats
        case activeChats
        
    }
    
    var dataSourse: UICollectionViewDiffableDataSource<Section, MChat>? // <объект типа секции, объект параметров секции>
    
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
        
        collectionView.register(ActiveChatCell.self, forCellWithReuseIdentifier: ActiveChatCell.reuseID)
        collectionView.register(WaitingChatCell.self, forCellWithReuseIdentifier: WaitingChatCell.reuseID)
    }
    
    private func reloadData() { // добавляем реальные данные
        // snapShot следит за изменением data
        var snapShot = NSDiffableDataSourceSnapshot<Section, MChat>()
        snapShot.appendSections([.waitingChats, .activeChats])
        snapShot.appendItems(waitingChats, toSection: .waitingChats)
        snapShot.appendItems(activeChats, toSection: .activeChats)
        
        dataSourse?.apply(snapShot, animatingDifferences: true)
    }
}

// MARK: - Data Source
extension ListViewController {
    
    private func configure<T: SelfConfiguringCell>(cellType: T.Type, with value: MChat, for indexPath: IndexPath) -> T {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellType.reuseID, for: indexPath) as? T else { fatalError("Enable to dequeue \(cellType)")}
        
        cell.configure(with: value)
        return cell
    }
    
    private func createDataSource() {
        dataSourse = UICollectionViewDiffableDataSource<Section, MChat>(
            collectionView: collectionView,
            cellProvider: { collectionView, indexPath, chat in
                
                guard let section = Section(rawValue: indexPath.section) else {
                    fatalError("Unknown section kind")
                }
                
                switch section {
                case .activeChats:
                    return self.configure(cellType: ActiveChatCell.self, with: chat, for: indexPath)
                case .waitingChats:
                    return self.configure(cellType: WaitingChatCell.self, with: chat, for: indexPath)
                }
            })
    }
}

// MARK: - Setup CompositionLayout
extension ListViewController {
    
    private func createCompositionLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (sectionIndex, layoutEnviroment) -> NSCollectionLayoutSection? in
            
            guard let section = Section(rawValue: sectionIndex) else {
                fatalError("Unknown section kind")
            }
            
            switch section {
            case .activeChats:
                return self.createActiveChats()
            case .waitingChats:
                return self.createWaitingChats()
            }
        }
        return layout
    }
    
    private func createWaitingChats() -> NSCollectionLayoutSection {
        
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .absolute(88),
            heightDimension: .absolute(88)
        )
        let group = NSCollectionLayoutGroup.horizontal(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 20
        section.contentInsets = NSDirectionalEdgeInsets.init(top: 16, leading: 20, bottom: 0, trailing: 20)
        section.orthogonalScrollingBehavior = .continuous
        
        return section
    }
    
    private func createActiveChats() -> NSCollectionLayoutSection {
        // layout = section -> group -> items -> size
        //задаем размеры item
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1)
        )
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .absolute(78)
        )
        let group = NSCollectionLayoutGroup.vertical(
            layoutSize: groupSize,
            subitems: [item]
        )
        
        let section = NSCollectionLayoutSection(group: group)
        // конфигурация размеров(отступов) всей секции
        section.interGroupSpacing = 8
        section.contentInsets = NSDirectionalEdgeInsets.init(
            top: 16, leading: 20, bottom: 0, trailing: 20
        )
        
        return section
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
