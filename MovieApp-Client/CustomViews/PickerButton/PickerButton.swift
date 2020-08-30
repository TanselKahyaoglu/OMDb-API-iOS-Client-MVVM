//
//  PickerButton.swift
//  MovieApp-Client
//
//  Created by Tansel Kahyaoglu on 29.08.2020.
//  Copyright © 2020 Tansel Kahyaoglu. All rights reserved.
//

import Foundation
import UIKit
import MVVM_Architecture

class PickerButton: UIButton {
    
    private var inputs: [String]?
    
    var initialTitle: String = ""{
        didSet {
            setTitle(initialTitle, for: .normal)
        }
    }
    
    var onFilterSelected: Handler<Int>?

    private lazy var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        return pickerView
    }()
    
    private lazy var tfInput: UITextField = UITextField() //For getting input.
    
    private func configureAction() {
        addGestureRecognizer(UITapGestureRecognizer(target: self,
                                                    action: #selector(actionButtonTap)))
    }
    
    private func configureTextField() {
        addSubview(tfInput)
    }
    
    @objc
    private func actionButtonTap() {
        tfInput.becomeFirstResponder()
    }
    
    @objc
    private func actionDone() {
        setTitle(inputs?[pickerView.selectedRow(inComponent: 0)], for: .normal)
        
    }
    
    func configureInputs(inputs: [String]) {
        self.inputs = inputs
        configureAction()
        configureTextField()
        tfInput.inputView = pickerView
    }

    func resetPicker() {
        setTitle(initialTitle, for: .normal)
        pickerView.selectRow(0,
                             inComponent: 0,
                             animated: false)
    }
    
}

extension PickerButton: UIPickerViewDataSource, UIPickerViewDelegate {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return inputs?.count ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return inputs?[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        setTitle(inputs?[row], for: .normal)
        tfInput.endEditing(true)
        onFilterSelected?(row)
    }
    
}
