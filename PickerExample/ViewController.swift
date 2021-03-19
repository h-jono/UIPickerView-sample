//
//  ViewController.swift
//  PickerExample
//
//  Created by 城野 on 2021/03/18.
//

import UIKit

final class ViewController: UIViewController {
    
    private var myUIPicker = UIPickerView()
    
    // value
    private let burritoSize: [String] = ["Small", "Middium", "Large"]
    private let burritoMenu: [String]  = ["Chicken", "Beef", "Vege", "Vegan"]
    private let burritoTopping: [String] = ["Lime", "Jalapeno", "Cheese"]
    private let takeout: [String] = ["For here", "To go"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myUIPicker.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        myUIPicker.delegate = self
        myUIPicker.dataSource = self
        
        myUIPicker.selectRow(1, inComponent: 0, animated: true)
        myUIPicker.selectRow(2, inComponent: 1, animated: true)
        myUIPicker.selectRow(3, inComponent: 2, animated: true)
        myUIPicker.selectRow(4, inComponent: 3, animated: true)
        
        view.addSubview(myUIPicker)
        
    }
    
}

extension ViewController: UIPickerViewDelegate {
    // Called when picker moved
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print("componet: \(component)")
        print("row: \(row)")
        
        switch component {
        case 0:
            print("value: \(burritoSize[row])")
        case 1:
            print("value: \(burritoMenu[row])")
        case 2:
            print("value: \(burritoTopping[row])")
        case 3:
            print("value: \(takeout[row])")
        default:
            print("Error")
        }
    }
}

extension ViewController: UIPickerViewDataSource {
    // Set number of Component
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 4
    }
    // Set the number of elements of components
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return burritoSize.count
        case 1:
            return burritoMenu.count
        case 2:
            return burritoTopping.count
        case 3:
            return takeout.count
        default:
            return 0
        }
    }
    
    // Set elements String
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return burritoSize[row]
        case 1:
            return burritoMenu[row]
        case 2:
            return burritoTopping[row]
        case 3:
            return takeout[row]
        default:
            return "Error"
        }
    }
    
    // Set elements UIView
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let cellLabel = UILabel()
        cellLabel.frame = CGRect(x: 0, y: 0, width: pickerView.rowSize(forComponent: 0).width, height: pickerView.rowSize(forComponent: 0).height)
        cellLabel.textAlignment = .center
        cellLabel.font = UIFont.boldSystemFont(ofSize: 16)
        cellLabel.backgroundColor = UIColor.black
        cellLabel.textColor = UIColor.white
        
        switch component {
        case 0:
            cellLabel.text = burritoSize[row]
        case 1:
            cellLabel.text = burritoMenu[row]
        case 2:
            cellLabel.text =  burritoTopping[row]
        case 3:
            cellLabel.text =  takeout[row]
        default:
            cellLabel.text = "Error"
        }
        
        return cellLabel
    }
}
