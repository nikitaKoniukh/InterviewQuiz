//
//  MainViewController.swift
//  InterviewQuiz
//
//  Created by Nikita Koniukh on 05/08/2019.
//  Copyright © 2019 Nikita Koniukh. All rights reserved.
//

import UIKit

struct ProgramLanguages {
    var name: String

}

class MainViewController: UIViewController {

    //Outlets
    @IBOutlet weak var tableView: UITableView!

    //Variables
    var reusableCell = "quizzListCell"
    var programLanguages = [ProgramLanguages]()

    var swift = ProgramLanguages(name: "Swift")



    override func viewDidLoad() {
        super.viewDidLoad()

        programLanguages.append(swift)
        setupTableView()
    }

    fileprivate func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }


    fileprivate func welcomeAlert() {
        let welcomeAlert = UIAlertController(title: "Before your start!",
                                             message: "You have one try for each quizz. For more info read Quizz Rulez",
                                             preferredStyle: .alert)
        welcomeAlert.addAction(UIAlertAction(title: "OK",
                                             style: .default))
        present(welcomeAlert, animated: true, completion: nil)
    }


}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return programLanguages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath)
        let item = programLanguages[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = tableView.dequeueReusableCell(withIdentifier: reusableCell, for: indexPath)
        performSegue(withIdentifier: "toQuizz", sender: item)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //guard let destination = segue.destination as? ViewController else {return}

       // destination.title =
    }


}
