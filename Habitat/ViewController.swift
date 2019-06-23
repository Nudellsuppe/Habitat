//
//  ViewController.swift
//  Habitat
//
//  Created by admin on 22.06.19.
//  Copyright © 2019 L.E.M. All rights reserved.
//

import UIKit





class ViewController: UIViewController {

    
    
    @IBOutlet weak var numberSegments: UISegmentedControl!
    @IBOutlet weak var startDatTF: UITextField!
    @IBOutlet weak var endDatTF: UITextField!
    @IBOutlet weak var apartSegm: UISegmentedControl!
    @IBOutlet weak var btnApartments: UIButton!
 
    @IBOutlet weak var apartTableView: UITableView!
    
    var numberPerson = true
    
    let datePicker = UIDatePicker()
    let datePicker2 = UIDatePicker()
    
   
    
    var people = 1
    var startDay = ""
    var endDay = ""
    var type = ""
    var items = [[String:AnyObject]]()
   // var apartments = [[String:AnyObject]]()
    
    
    var arrayDict = NSMutableArray()
    let yourOption = "file"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createDatePicker1()
        createDatePicker2()
       
        
    }
    
 
  
   
    @IBAction func apartmetSearch(_ sender: Any) {
        setupSearch()
        searchApartments()
    //    displayApartments()
    }
    
    func setupSearch(){
        
    }
    func searchApartments(){
    }
    
  
    
    
    
    
    @IBAction func apartSegPressed(_ sender: Any) {
        let value = apartSegm.selectedSegmentIndex
        if value == 0{
            type = "serviced"
        }else if value == 1{
            type = "student"
        }else{
            type = "senior"
        }
        print(type)
    }
    
    @IBAction func numSegPressed(_ sender: Any) {
       numberPerson = !numberPerson
        if(numberPerson){
            people = 1
        }else{
            people = 2
        }
        print(numberPerson)
        setupApartment()
    }
    
    func setupApartment(){
        if (!numberPerson){
            apartSegm.setEnabled(false, forSegmentAt: 0)
            apartSegm.selectedSegmentIndex = 1
        }else{
            apartSegm.setEnabled(true, forSegmentAt: 0)
        }
    }
    
    func createDatePicker1(){
        //format Display
        datePicker.datePickerMode = .date
        //assigne datePicker to textfield
        startDatTF.inputView = datePicker
        //create toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //add done button to toolbar
        let doneButten = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked1))
            
        toolbar.setItems([doneButten], animated: true)
        startDatTF.inputAccessoryView = toolbar
    }
    @objc func doneClicked1(){
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        startDatTF.text = dateFormater.string(from: datePicker.date)
        startDay = dateFormater.string(from: datePicker.date)
        self.view.endEditing(true)
    }
    
    func createDatePicker2(){
        //format Display
        datePicker2.datePickerMode = .date
        //assigne datePicker to textfield
        endDatTF.inputView = datePicker2
        //create toolbar
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        //add done button to toolbar
        let doneButten = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClicked2))
        
        toolbar.setItems([doneButten], animated: true)
        endDatTF.inputAccessoryView = toolbar
    }
    @objc func doneClicked2(){
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "dd/MM/yyyy"
        endDatTF.text = dateFormater.string(from: datePicker2.date)
        endDay = dateFormater.string(from: datePicker2.date)
        self.view.endEditing(true)
    }
    
}


