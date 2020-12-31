//
//  NewDataView.swift
//  UI-92
//
//  Created by にゃんにゃん丸 on 2020/12/31.
//

import SwiftUI

struct NewDataView: View {
    @ObservedObject var model : HomeViewModel
    @Environment(\.managedObjectContext) var context
    
    var body: some View {
        VStack{
            
            HStack{
                
                
                Text("\(model.updateitem == nil ? "Add New" : "Update")Task")
                    .font(.system(size: 75))
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
                
                
            }
            .padding()
            
            TextEditor(text: $model.content)
                .padding()
            
            Divider()
                .padding()
            HStack{
                
                Text("When")
                    .font(.title)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                
                Spacer(minLength: 0)
                
            }
            .padding()
            
            HStack(spacing:10){
                
                DataButton(title: "Today", model: model)
                
                DataButton(title: "Tomorrow", model: model)
                
                DatePicker("", selection: $model.date, displayedComponents: .date)
                    .labelsHidden()
                
                
            }
            .padding()
                
            
            Button(action: {model.writedata(context: context)}, label: {
                    Label(
                        title: { Text(model.updateitem == nil ? "Add now" : "Update")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                        },
                        icon: { Image(systemName: "plus")
                            .font(.title)
                            .foregroundColor(.white)
                            
                        })
                })
                .padding(.vertical)
                .frame(width: UIScreen.main.bounds.width - 30)
                .background(LinearGradient(gradient: .init(colors: [.blue,.red]), startPoint: .leading, endPoint: .trailing))
                .cornerRadius(8)
            .disabled(model.content == "" ? true : false)
            .opacity(model.content == "" ? 0.5 : 1)
            
            
           
            
        
            
        }
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .bottom))
    }
}

