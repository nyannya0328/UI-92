//
//  HomeViewModel.swift
//  UI-92
//
//  Created by にゃんにゃん丸 on 2020/12/31.
//

import SwiftUI
import CoreData

class HomeViewModel: ObservableObject {
    @Published var content = ""
    @Published var date = Date()
    @Published var isnewdate = false
    
    
    let calender = Calendar.current
    
    @Published var updateitem : Task!
    
    
    
    func checkdata() -> String{
        
        
        if calender.isDateInToday(date){
            
            return "Today"
            
        }
        else if calender.isDateInTomorrow(date){
            
            return "Tomorrow"
        }
        
        else{return "OtherDay"}
    }
    
    func update(value : String){
        
        if value == "Today"{date = Date()}
        
        else if value == "Tomorrow"{
            
            date = calender.date(byAdding: .day, value: 1, to: Date())!
            
            
        }
    
        
    }
    func writedata(context:NSManagedObjectContext){
        
        if updateitem != nil{
            
            updateitem.date = date
            updateitem.content = content
            try! context.save()
            
            updateitem = nil
            isnewdate.toggle()
            content = ""
            date = Date()
            return
            
        }
        
        
        let newtask = Task(context: context)
        newtask.date = date
        newtask.content = content
        
        do{
            try context.save()
            isnewdate.toggle()
            content = ""
            date = Date()
            
        }
        catch{
            
            print(error.localizedDescription)
            
        }
        
        
    }
    
    
    func Editeitem(item:Task){
        
        updateitem = item
        date = item.date!
        content = item.content!
        isnewdate.toggle()
        
        
        
    }
    
    

    

    
    
    
}
