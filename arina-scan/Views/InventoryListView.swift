//
//  ProductsListView.swift
//  arina-scan
//
//  Created by Ademie  on 05/10/2023.
//

import SwiftUI

struct InventoryListView: View {
  @StateObject var vm = InventoryListViewModel()
  var body: some View {
    List {
      ForEach(vm.items) { item in
        //                Text(item.name)
        InventoryListItemView(item: item)
          .listRowSeparator(.hidden)
          .contentShape(Rectangle())  //Keep the content boxed in
          .onTapGesture {

          }
      }
    }
    .navigationTitle("Arina")
    .onAppear {
      vm.listenToItems()
    }
  }
}

struct InventoryListItemView: View {
  let item: InventoryItem
  var body: some View {
    HStack(alignment: .top, spacing: 16) {
      ZStack {
        RoundedRectangle(cornerRadius: 8.0)
          .foregroundColor(Color.purple.opacity(0.2))

        if let thumbnailURL = item.thumbnailURL {
          AsyncImage(url: thumbnailURL) { phase in
            switch phase {
            case .success(let image):
              image.resizable().aspectRatio(contentMode: .fit)
            default:
              ProgressView()
            }
          }
        }
      }
      .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.purple.opacity(0.2), lineWidth: 2))
      .frame(width: 150, height: 150)

      VStack(alignment: .leading) {
        Text(item.name).font(.headline)
        Text("Quantity: \(item.quantity)").font(.subheadline)
      }

    }
  }
}
#Preview {
  NavigationStack {
    InventoryListView()
  }

}
