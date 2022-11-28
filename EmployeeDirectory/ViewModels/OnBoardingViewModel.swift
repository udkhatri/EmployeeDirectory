//
//  OnBoardingViewModel.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-28.
//

import SwiftUI

final class OnBoardingViewModel: ObservableObject {
    let navTitle: String = NSLocalizedString("onboarding_title", comment: "Employee List")
    let screenContent: String = NSLocalizedString("onboarding_content", comment: "Content")
    let buttonText: String = NSLocalizedString("onboarding_button", comment: "Continue")
    
    func changeUserOnboardingState(){
        UserDefaults.standard.set(true, forKey: "is_user_onboareded")
    }
}


