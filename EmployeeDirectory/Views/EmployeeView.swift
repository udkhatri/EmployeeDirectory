//
//  EmployeeView.swift
//  EmployeeDirectory
//
//  Created by Uday Khatri on 2022-11-23.
//

import SwiftUI

struct EmployeeView: View {
    //    var EmployeeDetails: Employee
   
    fileprivate func PlaceholderImageView() -> some View {
        return Rectangle()
            .foregroundColor(Color(uiColor: .systemGray2))
            .frame(width: .infinity, height: UIScreen.main.bounds.width)
            .overlay(
                VStack{
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
            )
    }
    
    var body: some View {
        VStack{
            AsyncImage(url: URL(string: "https://s3.amazonaws.com/sq-mobile-interview/photos/e2b088e6-0b8d-4295-a66c-d7181cdec3d6/large.jpg")) { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .overlay(EmployeeName(Name: "Uday"), alignment: .bottomLeading)
            } placeholder: {
                PlaceholderImageView()
            }
            .cornerRadius(30)
            .shadow(radius: 3, x: 2, y: 3)
            .frame(width: .infinity)
            .ignoresSafeArea(.all, edges: .top)
            Text("Hello buds...")
            Spacer()
        }
       
    }
}

struct EmployeeName: View {
    let Name: String
    var body: some View{
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
struct EmployeeView_Previews: PreviewProvider {
    static var previews: some View {
        EmployeeView()
    }
}
