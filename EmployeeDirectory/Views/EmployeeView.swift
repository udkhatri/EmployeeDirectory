//
//  EmployeeView.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-23.
//

import SwiftUI

struct EmployeeView: View {
    var EmployeeDetails: Employee
   
    fileprivate func PlaceholderImageView(isNill:Bool) -> some View {
        return Rectangle()
            .foregroundColor(Color(uiColor: .systemGray2))
            .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            .overlay(
                VStack{
                    if isNill {
                        Text("No Image Found")
                            .font(.title)
                            .foregroundColor(.gray)
                            .fontWeight(.semibold)
                    }else {
                        Spacer()
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .black))
                            .scaleEffect(2)
                            .padding(.top, 70)
                        Spacer()
                        HStack{
                            Rectangle()
                                .frame(width: 120, height: 35)
                                .cornerRadius(10)
                                .foregroundColor(.gray)
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                    }
                }
            )
    }
    
    fileprivate func TitleText(text:String) -> some View {
        return Text(text)
            .padding(.leading, 10)
            .font(.title2)
    }
    
    fileprivate func InfoView(text:String, tintColor: Color) -> some View {
        return Text(text)
            .frame(minHeight: 25)
            .padding(5)
            .background(tintColor)
            .foregroundColor(.white)
            .cornerRadius(5)
            .padding(.leading, 10)
    }
    
    var body: some View {
        VStack(alignment: .leading){
            if EmployeeDetails.photoUrlLarge == nil {
                PlaceholderImageView(isNill:true)
            }else{
                AsyncImage(url: URL(string: EmployeeDetails.photoUrlLarge!)) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .overlay(EmployeeName(Name: EmployeeDetails.fullName), alignment: .bottomLeading)
                } placeholder: {
                    PlaceholderImageView(isNill:false)
                }
                .cornerRadius(30)
                .shadow(radius: 3, x: 2, y: 3)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.width)
            }
            
            ScrollView(){
                VStack(alignment: .leading){
                    Text(EmployeeDetails.biography ?? "" )
                        .padding(10)
                    HStack{
                        InfoView(text: EmployeeDetails.employeeType, tintColor: Color.indigo)
                        InfoView(text: EmployeeDetails.team, tintColor: Color.orange)
                    }
                    
                    // Contact Info section
                    TitleText(text: "Contact Information")
                    // Phone number
                    ContactInfoRow(icon: "phone.fill", content: EmployeeDetails.phoneNumber!, tintColor: Color(uiColor: .systemMint))
                    // Email Id
                    ContactInfoRow(icon: "envelope.fill", content: EmployeeDetails.emailAddress, tintColor: Color(uiColor: .systemBrown))
                    
                    Spacer()
                }
            }
        }.ignoresSafeArea(.all, edges: .top)
    }
}

struct ContactInfoRow: View {
    let icon:String
    let content:String
    let tintColor:Color
    var body: some View{
        HStack{
            Image(systemName: icon)
                .font(.system(size: 20))
                .padding(15)
                .foregroundColor(.white)
                .fontWeight(.semibold)
                .background(tintColor)
                .frame(width: 40, height: 40)
                .cornerRadius(40)
            Text(content)
                .foregroundColor(tintColor)
                .fontWeight(.semibold)
        }.padding(.leading)
    }
}

struct EmployeeName: View {
    let Name: String
    var body: some View{
        HStack{
            Text(Name)
                .font(.largeTitle)
                .padding(.leading, 20)
                .padding(.bottom, 10)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .shadow(color: .primary,
                         radius: 5,
                         x: 2, y: 2)
        }
            
    }
}
