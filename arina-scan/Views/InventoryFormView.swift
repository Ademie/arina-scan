//
//  InventoryFormView.swift
//  arina-scan
//
//  Created by Ademie  on 05/10/2023.
//

import SwiftUI

struct InventoryFormView: View {
    
    @StateObject var vm = InventoryFormViewModel()
    var body: some View {
        Form {
            List {
                inputSection
            }
        }
    }
}

#Preview {
    NavigationStack{
        InventoryFormView()
    }
    
}
