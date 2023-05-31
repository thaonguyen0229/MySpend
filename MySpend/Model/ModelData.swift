//
//  DataModel.swift
//  MySpend
//
//  Created by Amanda Pham on 2023-05-31.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var expenses : [Expense] = []
}
