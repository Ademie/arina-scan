//
//  ProductsListView.swift
//  arina-scan
//
//  Created by Ademie  on 05/10/2023.
//

import SwiftUI

struct InventoryListView: View {
  @StateObject var vm = InventoryListViewModel()
  @State var formType: FormType?

  var body: some View {
    List {
      ForEach(vm.items) { item in
        //                Text(item.name)
        InventoryListItemView(item: item)
          .listRowSeparator(.hidden)
          .contentShape(Rectangle())  //Keep the content boxed in
          .onTapGesture {
            formType = .edit(item)
          }
      }
    }
    .navigationTitle("Arina")
    .toolbar {
      ToolbarItem(placement: .primaryAction) {
        Button("+ Item") {
          formType = .add
        }
      }
    }
    .sheet(item: $formType) { type in
      NavigationStack {
        InventoryFormView(vm: .init(formType: type))
      }
      .presentationDetents([.fraction(0.9)])
      .interactiveDismissDisabled()
    }
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
          .foregroundColor(Color.blue.opacity(0.1))

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
      .overlay(RoundedRectangle(cornerRadius: 8).stroke(Color.blue.opacity(0.2), lineWidth: 2))
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
