//
//  AmicoStore.swift
//  amplify
//
//  Created by Fenu, Leonardo on 23/04/2021.
//

import Foundation
import Amplify

class AmicoStore: ObservableObject {
  
  static let defaultAmici = [
    Amico(nome: "Pino", regali: ""),
    Amico(nome: "Gino", regali: ""),
    /*
     Amico(nome: "Lino", regali: RegaloStore()),
     Amico(nome: "Cino", regali: RegaloStore()),
     Amico(nome: "Dino", regali: RegaloStore()),
     Amico(nome: "Mino", regali: RegaloStore()),
     Amico(nome: "Nino", regali: RegaloStore()),
     Amico(nome: "Rino", regali: RegaloStore()),
     Amico(nome: "Tino", regali: RegaloStore()),
     */
  ]
  
  static func loadAmici() -> [Amico] {
    AmicoStore.defaultAmici
  }
  
  @Published var amici = loadAmici()
  
  func addAmico(nome: String) {
    let newAmico = Amico(nome: nome)
    
    Amplify.DataStore.save(newAmico) { result in
      switch(result) {
      case .success(let savedAmico):
        print("Saved item: \(savedAmico.id)")
        self.amici.append(newAmico)
      case .failure(let error):
        print("Could not save item to DataStore: \(error)")
      }
    }
    
  }
  
  func deleteAmico(at offsets: IndexSet) {
    amici.remove(atOffsets: offsets)
  }
  
  func editRegalo() {
    objectWillChange.send()
  }
}
