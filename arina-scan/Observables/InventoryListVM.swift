//
//  ProductsListVM.swift
//  arina-scan
//
//  Created by Ademie  on 05/10/2023.
//

import FirebaseFirestore
//USING THE OLD PLAIN OBSERVABLE OBJET
import Foundation
import SwiftUI

//it exposes or publishes the property of the array and listen for updates from firebase
class InventoryListViewModel: ObservableObject {
  @Published var items = [InventoryItem]()

  @MainActor
  func listenToItems() {
    Firestore.firestore().collection("products")
      .order(by: "name")
      .limit(toLast: 100)
      .addSnapshotListener { snapshot, error in
        guard let snapshot else {
          print("Error fetching snapshot: \(error?.localizedDescription ?? "error")")
          return
        }
        let docs = snapshot.documents
        let items = docs.compactMap {
          try? $0.data(as: InventoryItem.self)
        }

        withAnimation {
          self.items = items
        }

      }
  }

}
