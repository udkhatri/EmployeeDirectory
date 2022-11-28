//
//  OnBoarding.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-21.
//

import SwiftUI

struct OnBoardingView: View {
    @StateObject var viewModel: OnBoardingViewModel = OnBoardingViewModel()
    var body: some View {
        
        VStack(spacing: 20){
            Text(viewModel.navTitle)
                .foregroundColor(.white)
                .font(.largeTitle)
                .fontWeight(.medium)
                .padding()
            Spacer()
            Circle()
                .frame(width: 150)
                .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
                .overlay(
                    VStack{
                        Text("LOGO")
                            .font(.title)
                            .fontWeight(.bold)
                            .foregroundColor(Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)))
                    })
                .shadow(color: .white, radius: 30)
            Spacer()
            Text(viewModel.screenContent)
                .foregroundColor(.white)
                .padding()
            bottomButton
        }.background(
            RadialGradient(
                colors: [Color(#colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)), Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1))],
                center: .topTrailing,
                startRadius: 50,
                endRadius: UIScreen.main.bounds.height)
        )
    }
    // Bottom button which will be used to store value in user defaults
    private var bottomButton: some View {
        Text(viewModel.buttonText)
            .font(.headline)
            .foregroundColor(Color(#colorLiteral(red: 0.1411764771, green: 0.3960784376, blue: 0.5647059083, alpha: 1)))
            .frame(height: 50)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(10)
            .padding(20)
            .onTapGesture {
                viewModel.changeUserOnboardingState()
            }
    }
}

struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoardingView()
    }
}
