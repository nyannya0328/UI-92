//
//  DataButton.swift
//  UI-92
//
//  Created by にゃんにゃん丸 on 2020/12/31.
//

import SwiftUI

struct DataButton: View {
    var title : String
    
    @ObservedObject var model : HomeViewModel
    var body: some View {
        
        Button(action: {model.update(value: title)}, label: {
            Text(title)
                .padding(.vertical,10)
                .padding(.horizontal,20)
                .foregroundColor(model.checkdata() == title ? .gray : .white)
                .background(
                    model.checkdata() == title ?
                    
                    LinearGradient(gradient: .init(colors: [.red,.blue]), startPoint: .leading, endPoint: .trailing)
                    
                    : LinearGradient(gradient: .init(colors: [.purple,.green]), startPoint: .leading, endPoint: .trailing)
                )
                .cornerRadius(6)
            
            
        })
    }
}

