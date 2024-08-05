//
//  DateSelectorView.swift
//  Tasks
//
//  Created by siddhatech on 01/08/24.
//

import SwiftUI

struct DateSelectorMainView: View {
    @State private var fromDate: Date = Date()
    @State private var toDate: Date = Date()
    
    var body: some View {
        HStack(spacing: 20) {
            DateSelectorView(title: "Desde", date: $fromDate, minDate: nil, maxDate: toDate)
            DateSelectorView(title: "Hasta", date: $toDate, minDate: fromDate, maxDate: nil)
        }
        .padding()
    }
}

struct DateSelectorView: View {
    var title: String
    @Binding var date: Date
    var minDate: Date?
    var maxDate: Date?
    
    var body: some View {
        VStack(alignment: .leading, spacing: 5) {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            
            HStack {
                Text(dateFormatted(date: date))
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.primary)
                Spacer()
                Image(systemName: "calendar")
                    .foregroundColor(.blue)
            }
            .padding()
            .frame(width: 140, height: 60)
            .background(RoundedRectangle(cornerRadius: 10)
                            .stroke(lineWidth: 1)
                            .foregroundColor(title == "Desde" ? .blue : .gray))
        }
        .onTapGesture {
            showDatePicker()
        }
    }
    
    func dateFormatted(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        return formatter.string(from: date)
    }
    
    func showDatePicker() {
            let alert = UIAlertController(title: "Select Date", message: nil, preferredStyle: .actionSheet)
            
            // Add the date picker to the alert
            alert.addDatePicker(mode: .date, date: date, minimumDate: minDate, maximumDate: maxDate) { selectedDate in
                self.date = selectedDate
            }
            
            // Add a "Done" button
            alert.addAction(UIAlertAction(title: "Done", style: .cancel, handler: nil))
            
            // Present the alert
            UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
        }
    }

    extension UIAlertController {
        func addDatePicker(mode: UIDatePicker.Mode, date: Date?, minimumDate: Date?, maximumDate: Date?, action: @escaping (Date) -> Void) {
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = mode
            datePicker.date = date ?? Date()
            datePicker.minimumDate = minimumDate
            datePicker.maximumDate = maximumDate
            datePicker.translatesAutoresizingMaskIntoConstraints = false
            datePicker.preferredDatePickerStyle = .wheels

            self.view.addSubview(datePicker)
            
            self.view.heightAnchor.constraint(equalToConstant: 300).isActive = true
            datePicker.widthAnchor.constraint(equalTo: self.view.widthAnchor).isActive = true
            datePicker.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 20).isActive = true

            self.addAction(UIAlertAction(title: "Done", style: .default, handler: { _ in
                action(datePicker.date)
            }))
        }
    }


#Preview {
    DateSelectorMainView()
}

