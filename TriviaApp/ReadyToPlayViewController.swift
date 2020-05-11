//
//  ReadyToPlayViewController.swift
//  TriviaApp
//
//  Created by Mike Bodie on 4/13/20.
//  Copyright © 2020 Mike Bodie. All rights reserved.
//

import UIKit

import TriviaUtilityPackage
//commented global variable
var testList = [String]()
//var data = [UInt]()
//var testList = ["Team 1 mike", "Team Mikey", "Team Steph"]
class ReadyToPlayViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    //var testList = [String]()
    //var data: [UInt] = Array(count: 20, repeatedValue: 0)
    
    //var data = [UInt](repeating: 0, count: testList.count)

    @IBOutlet weak var ReadyToPlayLabel: UILabel!
    @IBOutlet weak var TeamsTable: UITableView!
    var questionNumberSaver = Int()
    //var testList = ["Team 1 mike", "Team Mikey", "Team Steph"]
    
    //function gets the number of rows for the tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return (testList.count)
    }

    //function configures cells for the tableview
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //test code based on UITableView Tutorial with custom cells youtube video
        let name = testList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "prototypeCell") as! ScoreboardCell
        cell.configureWithValue(value: dataList[indexPath.row], incrementHandler: incrementHandler(), decrementHandler: decrementHandler())
        cell.setName(nameOfTeam: name)
        //cell.setScore(beginScore: Int(0))
        
        //CODE BELOW THIS COMMENT WORKS
        
        //commented line below was replaced with line using dequeue
        //let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "prototypeCell")
        
        
        //formatting table view cells
        //cell.textLabel?.text = testList[indexPath.row]
        //cell.textLabel?.textAlignment = .left
        cell.backgroundColor = .systemTeal
        //cell.textLabel?.textColor = .white
        //cell.textLabel?.font = .systemFont(ofSize: 24)
        
        cell.layer.masksToBounds = true
        cell.layer.cornerRadius = 5
        cell.layer.borderWidth = 2
        return cell
    }
    
    func incrementHandler() -> ButtonHandler {
        return { [unowned self] cell in
            guard let row = self.TeamsTable.indexPath(for: cell)?.row else { return }
            dataList[row] = dataList[row] + UInt(1)
            

            self.TeamsTable.reloadData()
        }
    }
    
    private func decrementHandler() -> ButtonHandler {
           return { [unowned self] cell in
               guard
                let row = self.TeamsTable.indexPath(for: cell)?.row, dataList[row] > 0
                   else { return }
               dataList[row] = dataList[row] - UInt(1)

            self.TeamsTable.reloadData()
           }
       }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        if editingStyle == UITableViewCell.EditingStyle.delete{
            testList.remove(at: indexPath.row)
            TeamsTable.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TeamsTable.delegate = self
        TeamsTable.dataSource = self
        
        //trying to reload data in view controller
        //Second parameter selector: #selector(loadList)
//        NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load"), object: nil)
        TeamsTable.tableFooterView = UIView()

        // Do any additional setup after loading the view.
    }
    
    //function is attempting to reload data in tableview TeamsTable

    @IBAction func playGame(_ sender: Any) {
        //TriviaUtilityPackage.shared.generateTriviaFunction(count: 10)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        TeamsTable.reloadData()
    }
    
    //testing to send the question number back to the question view controller
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playGameSegue" {
            let vc = segue.destination as! QuestionViewController
            vc.secondResultLabelText = "Testing"
            //Send question number incremented back to QuestionViewController
            vc.questionNum = (questionNumberSaver)
            print(questionNumberSaver)
        }
    }
    
    
    func updateTableView() {
        TeamsTable.reloadData() // you do have an outlet of tableView I assume
    }

}
//extension ScoreboardCell: CustomCellUpdater {
//    func updateTableView() {
//        TeamsTable.reloadData()
//    }
//}

