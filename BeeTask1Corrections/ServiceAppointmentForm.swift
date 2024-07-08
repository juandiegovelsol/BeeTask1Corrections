// ServiceAppointmentForm.swift
import SwiftUI

struct ServiceAppointmentForm: View {
    @ObservedObject var viewModel: CarMaintenanceViewModel
    @State private var serviceName = ""
    @State private var appointmentDate = Date()
    @State private var serviceDescription = ""
    @State private var showAlert = false
    @State private var alertMessage = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            CustomTextField(placeholder: "Service Name", text: $serviceName)
            
            DatePicker("Appointment Date", selection: $appointmentDate, in: Date()..., displayedComponents: .date)
                .datePickerStyle(CompactDatePickerStyle())
            
            CustomTextField(placeholder: "Service Description", text: $serviceDescription)
            
            Button(action: createService) {
                Text("Create Service")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
        .padding()
        .alert(isPresented: $showAlert) {
            Alert(title: Text("Error"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
        }
    }
    
    private func createService() {
        guard !serviceName.isEmpty else {
            showAlert(message: "Service name cannot be empty")
            return
        }
        
        guard !serviceDescription.isEmpty else {
            showAlert(message: "Service description cannot be empty")
            return
        }
        
        guard appointmentDate+3600 > Date() else {
            showAlert(message: "Appointment date must be in the future")
            return
        }
        
        viewModel.addAppointment(serviceName: serviceName, date: appointmentDate, description: serviceDescription)
        resetForm()
    }
    
    private func resetForm() {
        serviceName = ""
        appointmentDate = Date()
        serviceDescription = ""
    }
    
    private func showAlert(message: String) {
        alertMessage = message
        showAlert = true
    }
}
