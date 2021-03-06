//
//  DateRangeType.swift
//  incredible_trata
//
//  Created by Ryabin Kirill on 09.11.2021.
//

import Foundation

enum DateRange {
    case week(Date)
    case month(Date)
    case year(Date)
    case custom(DateInterval)

    // MARK: - Public Properties
    // TODO: end date not in range
    var dateInterval: DateInterval {
        let calendar = Calendar.current
        var dateInterval: DateInterval = DateInterval(start: Date(), end: Date())

        switch self {
        case .week(let date):
            dateInterval = calendar.dateInterval(of: .weekOfYear, for: date) ?? dateInterval

        case .month(let date):
            dateInterval = calendar.dateInterval(of: .month, for: date) ?? dateInterval

        case .year(let date):
            dateInterval = calendar.dateInterval(of: .year, for: date) ?? dateInterval
            
        case .custom(let dateInterval):
            return dateInterval
        }
        return dateInterval
    }

    var labelText: String {
        let calendar = Calendar.current
        switch self {
        case .week:
            let weekOfYear = calendar.component(.weekOfYear, from: dateInterval.start)
            return "Week \(weekOfYear)"

        case .month:
            let monthOnly = DateFormatter()
            monthOnly.dateFormat = "LLLL"
            // return "\(dateInterval.start, formatter: monthOnly)"
            let nameOfMonth = monthOnly.string(from: dateInterval.start)
            return nameOfMonth

        case .year:
            let year = calendar.component(.year, from: dateInterval.start)
            return "\(year)"

        case .custom:
            return "Custom"
        }
    }

    var title: String {
        dateInterval.start.formatted(date: .abbreviated, time: .omitted) + " - " +
        dateInterval.end.formatted(date: .abbreviated, time: .omitted)
    }

    // MARK: - Public Methods
    mutating func moveToNextRange() {
        let calendar = Calendar.current

        switch self {
        case .week(let date):
            self = .week(calendar.date(byAdding: .weekOfYear, value: 1, to: date) ?? date)

        case .month(let date):
            self = .month(calendar.date(byAdding: .month, value: 1, to: date) ?? date)

        case .year(let date):
            self = .year(calendar.date(byAdding: .year, value: 1, to: date) ?? date)

        case .custom:
            break
        }
    }

    mutating func moveToPreviousRange() {
        let calendar = Calendar.current
        switch self {
        case .week(let date):
            self = .week(calendar.date(byAdding: .weekOfYear, value: -1, to: date) ?? date)

        case .month(let date):
            self = .month(calendar.date(byAdding: .month, value: -1, to: date) ?? date)

        case .year(let date):
            self = .year(calendar.date(byAdding: .year, value: -1, to: date) ?? date)

        case .custom:
            break
        }
    }
}
