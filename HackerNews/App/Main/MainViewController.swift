//
//  ViewController.swift
//  HackerNews
//
//  Created by Oh Coyan on 23/02/2020.
//  Copyright © 2020 Oh Coyan. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Shimmer

class MainViewController: UIViewController, Storyboarded {
    static var storyboard: AppStoryboard = AppStoryboard.main
    
    var mainViewModel: MainViewModel?
    var items: [HackerNewsItemModel?] = []
    @IBOutlet weak var topStoriesTableView: UITableView!
    
    @IBOutlet weak var mainLoadingIndicator: UIActivityIndicatorView!
    private let bag = DisposeBag()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.topStoriesTableView.register(UINib(nibName: K.topStoriesCellNibName, bundle: nil), forCellReuseIdentifier: K.topStoriesCellIdentifier)
        
        self.topStoriesTableView.rx.itemSelected.subscribe(onNext: { [weak self] indexPath in
            self?.mainViewModel?.onTopStorySelected(model: indexPath.row)
        }).disposed(by: bag)
        
        mainViewModel?.getLoading()
        .map {res in !res}
        .bind(to:
            self.mainLoadingIndicator.rx.isHidden
        ).disposed(by: bag)
                
        mainViewModel?.getLoading()
        .bind(to:
            self.topStoriesTableView.rx.isHidden
        ).disposed(by: bag)
        
        mainViewModel?.getTopStoryDetails().bind(to: self.topStoriesTableView.rx.items(cellIdentifier: K.topStoriesCellIdentifier,    cellType: TopStoryViewCell.self)) { (row,item,cell) in
            if (item.viewType == ViewType.empty) {
                self.mainViewModel?.callTopStoryDetailsAPI(id: item.id)
                cell.isUserInteractionEnabled = false;
                cell.titleLabel?.isHidden = true
                cell.loadingIndicator?.startAnimating()
                cell.loadingIndicator?.isHidden = false
            } else {
                cell.titleLabel?.text = item.title
                cell.isUserInteractionEnabled = true;
                cell.titleLabel?.isHidden = false
                cell.loadingIndicator?.stopAnimating()
                cell.loadingIndicator?.isHidden = true
            }
           }.disposed(by: bag)
        // Do any additional setup after loading the view.
        
        mainViewModel?.startScreen()
        

    }
    
}
