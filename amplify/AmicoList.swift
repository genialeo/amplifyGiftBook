//
//  AmicoList.swift
//  amplify
//
//  Created by Fenu, Leonardo on 23/04/2021.
//

import SwiftUI

struct AmicoList: View {
  @EnvironmentObject var amicoStore: AmicoStore
  @State private var showingAddAmico = false
  
  var body: some View {
    NavigationView {
      List {
        ForEach(amicoStore.amici, id: \.id) { amico in
          AmicoRowView(amico: amico)
        }
      }
      .navigationBarTitle(Text("Amici"))
      .navigationBarItems(
        trailing:
          Button(action: { showingAddAmico = true
          }) {
            Image(systemName: "plus")
          }
      )
    }
  }
}

struct AmicoRowView: View {
  var amico: Amico
  var body: some View {
    VStack {
      if let nome = amico.nome {
      Text(nome)
        .font(.title)
      }
    }
  }
}

struct AmicoList_Previews: PreviewProvider {
  static var previews: some View {
    AmicoList()
  }
}
