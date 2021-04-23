//
//  amplifyApp.swift
//  amplify
//
//  Created by Fenu, Leonardo on 23/04/2021.
//


import SwiftUI

import Amplify
import AWSDataStorePlugin

@main
struct amplifyApp: App {
  public init() {
    configureAmplify()
  }
  var body: some Scene {
    WindowGroup {
      ContentView().environmentObject(AmicoStore())
    }
  }
}

func configureAmplify() {
  let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
  //let apiPlugin = AWSAPIPlugin(modelRegistration: AmplifyModels()) // UNCOMMENT this line once backend is deployed
  
  do {
    try Amplify.add(plugin: dataStorePlugin)
    //try Amplify.add(plugin: apiPlugin) // UNCOMMENT this line once backend is deployed
    try Amplify.configure()
    print("Initialized Amplify");
  } catch {
    // simplified error handling for the tutorial
    print("Could not initialize Amplify: \(error)")
  }
}
