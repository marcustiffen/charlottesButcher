//
//  ProfileView.swift
//  CharlottesButcher
//
//  Created by Marcus Tiffen on 28/01/2024.
//

import SwiftUI

struct ProfileView: View {
    @State private var username: String = ""
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State private var phoneNumber: String = ""
    
    var body: some View {
        NavigationStack {
            List {
                VStack {
                    Spacer()
                    PictureView()
                        .frame(maxWidth: .infinity)
                    Spacer()
                }
                
                Section {
                    TextField("Username", text: $username)
                }
                
                Section {
                    TextField("First Name", text: $firstName)
                    TextField("Last Name", text: $lastName)
                }
                
                Section {
                    TextField("E-mail address", text: $email)
                }
                
                Section {
                    TextField("Phone", text: $phoneNumber)
                        .keyboardType(.decimalPad)
                }
            }
            .scrollContentBackground(.hidden)
            .background(.gray)
            .navigationTitle("My Profile")
        }
    }
}

#Preview {
    ProfileView()
}
