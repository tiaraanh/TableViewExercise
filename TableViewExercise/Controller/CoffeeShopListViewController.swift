//
//  CoffeeShopListViewController.swift
//  TableViewExercise
//
//  Created by Tiara H on 16/09/22.
//

import UIKit

class CoffeeShopListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    var coffeeshops: [Coffeeshop] = [
        Coffeeshop(name: "Boja Eatery", type: "Coffeeshop / Cafe", location: "Jl. Pungkur", image: nil, isFavorite: false),
        
        Coffeeshop(name: "Brewery Coffee", type: "Tea House", location: "Jl. Buahbatu", image: "brewery", isFavorite: false),
        
        Coffeeshop(name: "Casadela Coffee", type: "Cafe Shop", location: "Jl. Asia Afrika", image: "casadela", isFavorite: false),
        
        Coffeeshop(name: "Dago Terrace", type: "Home Coffee", location: "Jl. Sudirman", image: "dagoterrace", isFavorite: false),
        
        Coffeeshop(name: "Hola Koffie", type: "Coffeeshop / Cafe", location: "Jl. Setiabudi", image: "holakoffie", isFavorite: false),
        
        Coffeeshop(name: "Imah Kai", type: "Tea House", location: "Jl. Boscha", image: "imahkai", isFavorite: false),
        
        Coffeeshop(name: "Jiwan Kopi", type: "Cafe", location: "Jl. Sukabumi", image: "jiwan", isFavorite: false),
        
        Coffeeshop(name: "Kilogram Space", type: "Home Coffee", location: "Jl. Soekarno Hatta", image: "kilogram", isFavorite: false),
        
        Coffeeshop(name: "Masagi Coffee", type: "Bakery / Cafe", location: "Jl. Kopo", image: "masagi", isFavorite: false),
        
        Coffeeshop(name: "Nannys Pavillion", type: "Tea House / Cafe", location: "Jl. Dago", image: "nannys", isFavorite: false),
        
        Coffeeshop(name: "Sabana Kopi", type: "Coffeeshop / Bakery", location: "Jl. Cibiru", image: "sabanakopi", isFavorite: false),
        
        Coffeeshop(name: "Sini Kupi", type: "Coffeeshop / Milk House", location: "Jl. Aceh", image: "sinikupi", isFavorite: false),
        
        Coffeeshop(name: "Sonowae Kopi", type: "Coffeeshop / Cafe", location: "Jl. Cihapit", image: "sonowae", isFavorite: false),
        
        Coffeeshop(name: "Starbuck Coffee", type: "Bakery", location: "Jl. Gandapura", image: "starbuck", isFavorite: false),
        
        Coffeeshop(name: "Urra Cafe", type: "Warmindo", location: "Jl. Riau", image: "urracafe", isFavorite: false)
    ]
    
    var favoritedCoffeeShops: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return coffeeshops.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "coffeeShopCellId", for: indexPath) as! coffeeShopViewCell
        
        let coffeeshop = coffeeshops[indexPath.row]
        
        if let image = coffeeshop.image {
            cell.thumbImageView.image = UIImage(named: image)
        } else {
            cell.thumbImageView.image = UIImage(systemName: "photo")
        }
        
        
        cell.nameLabel.text = coffeeshop.name
        cell.addressLabel.text = coffeeshop.location
        cell.categoryLabel.text = coffeeshop.type
        
        if coffeeshop.isFavorite {
            cell.favoriteImageView.isHidden = false
        } else {
            cell.favoriteImageView.isHidden = true
        }


        
        return cell
    }
    
    // MARK: - Helper Functions
    
    func reserveTable(_ index: Int) {
        let alert = UIAlertController(title: "Not Available yet", message: "Sorry this feature is not available yet.\nPlease try again later.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    /*
    // to check
    func isFavorite(_ index: Int) -> Bool {
       return favoritedCoffeeShops.contains(where: { item in
            return item == index })
    }
    
         if the closure only 1 line
         $0 refer to item position in array
         item is iteration from array of in checking
         logic is value element equals to index
    return favoritedCoffeeShops.contains(where: {
        $0 == index })
}
    */
    
    func toogleFavorite(_ index: Int) {
        if coffeeshops[index].isFavorite {
            coffeeshops[index].isFavorite = false
        } else {
            coffeeshops[index].isFavorite = true
        }
        
        // needs to remove
        
//        let idx = favoritedCoffeeShops.firstIndex(where: { item in
//            return item == index
//        })
//        if idx != nil {
//            favoritedCoffeeShops.remove(at: idx!)
        
//        if let idx = favoritedCoffeeShops.firstIndex(where: { item in return item == index }) {
//            favoritedCoffeeShops.remove(at: idx)
//
//        } else {
//            favoritedCoffeeShops.append(index)
//        }
        
        
        // remove element that has same value as index
//        if favoritedCoffeeShops.contains(where: { ind in
//            return ind == index }) {
//            favoritedCoffeeShops.removeAll { item in
//                return item == index
//            }
//        }
//        else {
//            favoritedCoffeeShops.append(index)
//        }
        
        
        //tableView.reloadData()
        tableView.reloadRows(at: [IndexPath(row: index, section: 0)], with: .automatic)
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let actionSheet = UIAlertController(title: "What do you want to do?", message: nil, preferredStyle: UIAlertController.Style.actionSheet)
        actionSheet.addAction(UIAlertAction(title: "Reserve a table", style: UIAlertAction.Style.default, handler: { alert in
            
            self.reserveTable(indexPath.row)
        }))
        
        
        if coffeeshops[indexPath.row].isFavorite {
            actionSheet.addAction(UIAlertAction(title: "Remove from favorite", style: .default, handler: { _ in
                self.toogleFavorite(indexPath.row)
            }))
        } else {
            actionSheet.addAction(UIAlertAction(title: "Mark as favorite", style: .default, handler: { _ in
                self.toogleFavorite(indexPath.row)
            }))
        }
        
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(actionSheet, animated: true)
        
        
        
    }
    // SLIDE
    
    // will limit edit cell
//    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//        return true
//    }
    
    
    // will called when we edit a cell
//    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
//        switch editingStyle {
//        case .delete:
//            delete(at: indexPath)
//        default:
//            break

//        }
//
//    }
    // func for delete
    func delete(at indexPath: IndexPath) {
        coffeeshops.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .automatic)
    }
    
    // func swipe from right
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let delete = UIContextualAction(style: .destructive, title: "Delete") { action, view, completion in
            self.delete(at: indexPath)
            completion(true)
        }
        delete.image = UIImage(systemName: "trash")
        
        
        let share = UIContextualAction(style: .normal, title: "Share") { _, view, completion in
            self.share(at: indexPath)
            completion(true)
        }
        
        share.image = UIImage(systemName: "square.and.arrow.up")
        share.backgroundColor = UIColor.systemYellow
        
        let actions = UISwipeActionsConfiguration(actions: [delete, share])
        actions.performsFirstActionWithFullSwipe = false
        return actions
    }
    
    // func for share
    func share(at indexPath: IndexPath) {
        let coffeeshop = coffeeshops[indexPath.row]
        
        let name = coffeeshop.name ?? ""
        print(name)
        
        let image: UIImage
        
        if let imageName = coffeeshop.image {
            image = UIImage(named: imageName) ?? UIImage(systemName: "photo")!
        } else {
            image = UIImage(systemName: "photo")!
        }
        
        let url = URL(string: "https://fazztrack.com/minicamp/ios-app-development/1b5a59ec-beaf-4f29-9cce-0b21b2089746")!
        
        // to popUp
        let viewController = UIActivityViewController(activityItems: [name, image, url], applicationActivities: nil)
        viewController.popoverPresentationController?.sourceView = view
        present(viewController,animated: true)
    }
    
    // func for favorite
    func favorite(at indexPath: IndexPath) {
        
        // call the cell
        let cells = tableView.cellForRow(at: indexPath) as! coffeeShopViewCell
        cells.favoriteImageView.isHidden = self.coffeeshops[indexPath.row].isFavorite
        
        // to hide/unhide the mark
        self.coffeeshops[indexPath.row].isFavorite = (self.coffeeshops[indexPath.row].isFavorite) ? false : true
        
        // change the mark
//        cells.accessoryType = (self.coffeeshops[indexPath.row]).isFavorite ? .checkmark : .none
//        cells.favoriteImageView = (self.coffeeshops[indexPath.row].isFavorite) ? false : true
        
    }
    
    
    
    // func swipe from left
    func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let favorite = UIContextualAction(style: .normal, title: "") { action, view, completion in
            self.favorite(at: indexPath)
            completion(true)
        }
        
        favorite.image = coffeeshops[indexPath.row].isFavorite ? UIImage(systemName: "heart.slash.fill") : UIImage(systemName: "heart.fill")
        favorite.backgroundColor = UIColor.systemYellow
          
        
        let actions = UISwipeActionsConfiguration(actions: [favorite])
        return actions
    }
    
    
    
    
    
}

