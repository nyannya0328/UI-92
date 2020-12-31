//
//  Home.swift
//  UI-92
//
//  Created by にゃんにゃん丸 on 2020/12/31.
//

import SwiftUI
import CoreData

struct Home: View {
    
    @StateObject var model = HomeViewModel()
    
    @FetchRequest(entity: Task.entity(), sortDescriptors: [NSSortDescriptor(key: "date",ascending: true)],animation:.spring()) var results : FetchedResults<Task>
    
    @Environment(\.managedObjectContext) var context
    var body: some View {
        
        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom), content: {
            
            VStack{
                
                
                HStack{
                    
                    Text("Tasks")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                    
                    
                    
                    Spacer()
                    
                }
                .padding()
                .padding(.top,UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.white)
                
                if results.isEmpty{
                    
                    Spacer()
                    
                    Text("No Task")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    Spacer()
                    
                }
                
                else{
                    ScrollView(.vertical, showsIndicators: false, content: {
                        
                        
                        LazyVStack(alignment: .leading, spacing: 20, content: {
                            ForEach(results){task in
                                
                                VStack(alignment: .leading, spacing: 10, content: {
                                    
                                    Text(task.content ?? "")
                                        .font(.title)
                                        .fontWeight(.bold)
                                    
                                    Text(task.date ?? Date(),style: .date)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        
                                    
                                    
                                })
                                .foregroundColor(.black)
                                .contextMenu{
                                    
                               
                                        Button(action: {model.Editeitem(item: task)}, label: {
                                            Text("Edit")
                                                .foregroundColor(.white)
                                                .background(Color.white)
                                                .preferredColorScheme(.light)
                                                
                                            
                                                
                                        })
                                    
                                    
                                    Button(action: {
                                        
                                        context.delete(task)
                                        try! context.save()
                                        
                                    }, label: {
                                        Text("Delete")
                                           
                                    })
                                    
                                  
                                }
                                
                                
                                
                                
                                
                            }
                        })
                        .padding()
                        
                        
                    })
                }
                
            }
            
            Button(action: {model.isnewdate.toggle()}, label: {
                Image(systemName: "plus")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .padding(20)
                    .background(
                        AngularGradient(gradient: .init(colors: [.pink,.orange]), center: .center)
                    
                    )
                    .clipShape(Circle())
                    
            })
            .padding()
            
            
            
        })
        
        .ignoresSafeArea(.all, edges: .top)
        .background(Color.black.opacity(0.06).ignoresSafeArea(.all, edges: .all))
        
            
        .sheet(isPresented: $model.isnewdate, content: {
            NewDataView(model: model)
        })
        

    }
}


