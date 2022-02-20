//
//  ProfileScreen.swift
//  DanilovDZ1
//
//  Created by Mikhail Danilov on 20.02.2022.
//

import SwiftUI

struct ProfileScreen: View {

    @State var presentingModal = false
    var body: some View {
        Button("Present") { self.presentingModal = true }
        .sheet(isPresented: $presentingModal) { ModalView(presentedAsModal: self.$presentingModal) }
    }
}

struct ProfileScreen_Previews: PreviewProvider {
    static var previews: some View {
        ProfileScreen()
    }
}

struct ModalView: View {
    @State private var text: String = "Какой то произвольный текст для UIViewRepresentable"
    @Binding var presentedAsModal: Bool

    var body: some View {
        Spacer()
        Button("dismiss") { self.presentedAsModal = false }
        Spacer()
        TextView(text: $text)
    }
}

struct TextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        let view = UITextView()
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.cornerRadius = 8
        return view
    }

    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
