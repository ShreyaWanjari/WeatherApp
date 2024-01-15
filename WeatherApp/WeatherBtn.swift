//
//  WeatherBtn.swift
//  WeatherApp
//
//  Created by Shreya Wanjari on 11/01/24.
//

import Foundation
import SwiftUI

struct weatherBtn :View{
    var title : String
    var textColor : Color
    var bgColor : Color
    
    var body : some View {
        Text(title)
            .frame(width: 280,height: 50)
            .background(bgColor)
            .font(.system(size: 20,weight: .bold,design: .default))
            .foregroundStyle(textColor)
            .cornerRadius(20)
    }
}
