//
//  MonthSelectionViewModel.swift
//  incredible_trata
//
//  Created by Ryabin Kirill on 19.11.2021.
//  

import Foundation

class MonthSelectionViewModel {

    var dates: [Date] = []

    func setData(completion: @escaping () -> Void) {
        // Delay is just to test if it works
        DispatchQueue.global(qos: .userInitiated).asyncAfter(deadline: .now() + 1) {
            let records = CoreDataManager.shared.getRecords()
            var dates = Array(Set(records.map {
                $0.creationDate?.trimTo(components: .month, .year) ?? Date()
            }))
            dates.sort(by: >)

            DispatchQueue.main.async {
                self.dates = dates
                completion()
            }
        }
    }
}
