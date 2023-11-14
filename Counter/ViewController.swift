//
//  ViewController.swift
//  Counter
//
//  Created by Sergey Ivanov on 13.11.2023.
//

import UIKit

class ViewController: UIViewController {

    // Переменные для UI
    @IBOutlet weak private var historyView: UITextView!
    @IBOutlet weak private var subButton: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var clickButton: UIButton!
    @IBOutlet weak private var clearButton: UIButton!
    
    // Внутренние переменные
    private lazy var dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        return formatter
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        historyView.text = "История изменений:"
    }
    
    @IBAction private func contWhenPressed(_ sender: Any) {
        if let text = counterLabel.text, let number = Int(text) {
            updateCounterLabel(newValue: number + 1, message: "значение изменено на +1")
        } else {
            showErrorAlert(message: "Некорректное значение в счетчике. Нажмите кнопку сбросить")
            updateHistory(with: "Некорректное значение в счетчике")
        }
    }
    
    @IBAction private func subWhenPressed(_ sender: Any) {
        guard let number = Int(counterLabel.text ?? "") else {
            showErrorAlert(message: "Некорректное значение в счетчике. Нажмите кнопку сбросить")
            updateHistory(with: "Некорректное значение в счетчике")
            return
        }
        
        if number > 0 {
            updateCounterLabel(newValue: number - 1, message: "значение изменено на -1")
        } else {
            updateHistory(with: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func clearWhenPress(_ sender: Any) {
        updateCounterLabel(newValue: 0, message: "значение сброшено")
    }
    
    private func updateHistory(with message: String) {
        historyView.text.append("\n[\(dateFormatter.string(from: Date()))]: \(message)")
        historyView.scrollToBottom() // Всегда держим скролл внизу
    }
    
    // Эта функция отвечает за обновление значения в counterLabel
    private func updateCounterLabel(newValue: Int, message: String) {
        counterLabel.text = String(newValue)
        updateHistory(with: message)
    }
    
    // Эта функция выводит для пользователя сообщения с ошибками
    private func showErrorAlert(message: String) {
        let alert = UIAlertController(title: "Ошибка", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
