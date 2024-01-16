//
//  LottoViewController.swift
//  SeSACNetworkAssignment
//
//  Created by 김진수 on 1/16/24.
//

import UIKit

class LottoViewController: UIViewController {

    @IBOutlet var lottoDateTextField: UITextField!
    @IBOutlet var numberLabels: [UILabel]!
    
    let manager = LottoAPIManager()
    let numberArray = Array(1...1102)
    
    let lottoPickerView = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

}

extension LottoViewController: UIPickerViewDelegate, UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return numberArray.count
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        manager.callResponse(number: numberArray[row]) { array in
            for (index ,item) in array.enumerated() {
                self.numberLabels[index].text = "\(item)"
            }
        }
        self.lottoDateTextField.text = "\(numberArray[row])회차"
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return "\(numberArray[row])"
    }
}

extension LottoViewController {
    func setupPickerView() {
        self.lottoPickerView.delegate = self
        self.lottoPickerView.dataSource = self
    }
    
    func setupTextField() {
        self.lottoDateTextField.tintColor = .clear
        self.lottoDateTextField.inputView = lottoPickerView
        self.lottoDateTextField.text = "\(1102) 회차"
        
        manager.callResponse(number: 1102) { array in
            for (index, value) in array.enumerated() {
                self.numberLabels[index].text = "\(value)"
                print(value)
            }
        }
    }
    
    func setupUI() {
        setupTextField()
        setupPickerView()
    }
}
