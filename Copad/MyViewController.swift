//
//  MyViewController.swift
//  Copad
//
//  Created by Cheng-Lung on 2017/2/6.
//  Copyright © 2017年 Cheng-Lung. All rights reserved.
//



import UIKit

class MyViewController: UIViewController, UICollectionViewDataSource {
    
    @IBOutlet  var myCollectionView: UICollectionView!
    @IBOutlet weak var myCollectionView_1: UICollectionView!
    override func viewDidLoad() {
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        //self.myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = myCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! MyCollectionViewCell
        
        // Configure the cell
        
        return cell
    }
    
    


}
