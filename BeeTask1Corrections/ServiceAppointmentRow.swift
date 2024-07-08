// ServiceAppointmentRow.swift
import SwiftUI

struct ServiceAppointmentRow: View {
    let appointment: ServiceAppointment
    let onDelete: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(appointment.serviceName)
                    .font(.headline)
                Text(appointment.date, style: .date)
                    .font(.subheadline)
                Text(appointment.description)
                    .font(.body)
            }
            Spacer()
            Button(action: onDelete) {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding()
        .background(Color.gray.opacity(0.1))
        .cornerRadius(10)
    }
}
