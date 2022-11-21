//
//  OnBoarding.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

struct OnBoarding: View {
    var body: some View {
        VStack(spacing: 20){
            Spacer()
            Text("Content will apear here")
                .foregroundColor(.white)
            Spacer()
            bottomButton
        }.background(
            RadialGradient(
                colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))],
                center: .topTrailing,
                startRadius: 50,
                endRadius: UIScreen.main.bounds.height)
        )
    }
}
// Bottom button which will be used to store value in user defaults 
private var bottomButton: some View {
    Text("Continue")
        .font(.headline)
        .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
        .frame(height: 50)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(10)
        .padding(20)
        .onTapGesture {
            UserDefaults.standard.set(true, forKey: "is_user_onboareded")
        }
}
struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
