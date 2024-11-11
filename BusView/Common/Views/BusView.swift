//
//  BusView.swift
//  BusView
//
//  Created by Catherine Megregian on 11/11/2024.
//

import SwiftUI

struct BusAnnotationView: View {
    
    var rotation: Double
    var body: some View {
        RoundedRectangle(cornerRadius: 4)
            .frame(width: 15, height: 35)
            .overlay {
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 6)
                    .foregroundStyle(Color.emberMedium)
                    .offset(y: -13)
            }
            .rotationEffect(.degrees(rotation))
    }
}

#Preview {
    BusAnnotationView(rotation: 180)
}
