//
//  TableViewController.swift
//  publicApi_homework
//
//  Created by Bekzat on 5/12/24.
//

import UIKit
import Alamofire
import SwiftyJSON
import SVProgressHUD

class TableViewController: UITableViewController {
    
    var arrayMovie = [MovieItem]()
    
    var movieID = MovieItem.init(json: "id")
     
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrayMovie.count
    }
    
    
   func loadData() {
        SVProgressHUD.show()
        let url = "https://api.themoviedb.org/3/movie/popular"
        let headers: HTTPHeaders = [
           "accept": "application/json",
           "Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhY2ZiNDZjNGY0Y2E3Y2U2NTgxYjBjZjMwYTZjZTE3NCIsIm5iZiI6MTczMzMzNDE4NC40MDgsInN1YiI6IjY3NTA5NGE4ZjA4Zjk1YzY1MjIyY2Y3YyIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.9jirV_psz5XoPHka1KsTZXiidDkGQ6EDnnJwD5W5Ys4"
       ]
       let parameters: Parameters = [
           "language": "en-US",
           "page": "1",
           "sort_by": "created_at.asc"
       ]
       
       AF.request(url, method: .get, parameters: parameters, headers: headers).responseData { response in
           SVProgressHUD.dismiss()
           if let data = response.data {
               let json = JSON(data)
                
                if let resultArray = json["results"].array {
                    for item in resultArray {
                        let movieItem = MovieItem(json: item)
                        self.arrayMovie.append(movieItem)
                    }
                    self.tableView.reloadData()
                    
                }
                
                
            }
            
        }
    }
    

    
    
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! MovieTableViewCell
            
            cell.setData(movie: arrayMovie[indexPath.row])
            
            return cell
        }
        override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 400
        }
        
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "View Controller") as! ViewController
        
        vc.poster = arrayMovie[indexPath.row].posterPath
        
        navigationController?.show(vc, sender: self)
    }
        
        
        /*
         // Override to support conditional editing of the table view.
         override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the specified item to be editable.
         return true
         }
         */
        
        /*
         // Override to support editing the table view.
         override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
         if editingStyle == .delete {
         // Delete the row from the data source
         tableView.deleteRows(at: [indexPath], with: .fade)
         } else if editingStyle == .insert {
         // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
         }
         }
         */
        
        /*
         // Override to support rearranging the table view.
         override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
         
         }
         */
        
        /*
         // Override to support conditional rearranging of the table view.
         override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
         // Return false if you do not want the item to be re-orderable.
         return true
         }
         */
        
        /*
         // MARK: - Navigation
         
         // In a storyboard-based application, you will often want to do a little preparation before navigation
         override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
         // Get the new view controller using segue.destination.
         // Pass the selected object to the new view controller.
         }
         */
        
    }

