////
////  MainPageExtension.swift
////  24_Solid
////
////  Created by MacBook Air on 08.05.24.
////
//
////import Foundation
//import UIKit
////
//
//extension MainPageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        viewModel.photosArray.count
//        //30
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
//        cell.updateCell(with: viewModel.photosArray[indexPath.row].urls.regular)
//        return cell
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var width: CGFloat = collectionView.frame.width/3-1
//        
//        if UIDevice.current.orientation.isLandscape {
//            width = collectionView.frame.width / 6 - 1
//        }
//        
//        return CGSize(width: width, height: width)
//    }
//
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let photo = dataSource.itemIdentifier(for: indexPath) else {return}
//        print(photo)
//        
//    }
//    
//    
//}
//
//
//
//
//
//
