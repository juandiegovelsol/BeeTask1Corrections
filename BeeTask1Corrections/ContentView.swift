// ContentView.swift
import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = CarMaintenanceViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 20) {
                    ServiceAppointmentForm(viewModel: viewModel)
                    
                    ForEach(Array(viewModel.appointments.enumerated()), id: \.element.id) { index, appointment in
                        ServiceAppointmentRow(appointment: appointment) {
                            viewModel.removeAppointment(at: index)
                        }
                    }
                }
                .padding()
            }
            .navigationTitle("Car Maintenance")
        }
    }
}
