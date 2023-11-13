//
//  ViewController.swift
//  Counter
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var historyView: UITextView!
    @IBOutlet weak var subButton: UIButton!
    @IBOutlet weak var counter: UILabel!
    @IBOutlet weak var clickButton: UIButton!
    @IBOutlet weak var clearButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyView.text = "История изменений:"
    }
    
    @IBAction func contWhenPressed(_ sender: Any) {
        if let text = counter.text, let number = Int(text) {
            counter.text = String(number + 1)
            updateHistory(with: "значение изменено на +1")
        } else {
            print("Ошибка, в label попал не текст")
        }
    }
    
    @IBAction func subWhenPressed(_ sender: Any) {
        if let text = counter.text, let number = Int(text) {
            var count = number
            if count > 0 {
                count -= 1
                counter.text = String(count)
                updateHistory(with: "значение изменено на -1")
            } else {
                updateHistory(with: "попытка уменьшить значение счётчика ниже 0")
            }
        }
    }
    
    @IBAction func clearWhenPress(_ sender: Any) {
        counter.text = "0"
        updateHistory(with: "значение сброшено")
    }
    
    func updateHistory(with message: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm"
        let dateString = dateFormatter.string(from: Date())
        
        historyView.text.append("\n[\(dateString)]: \(message)")
    }
}
