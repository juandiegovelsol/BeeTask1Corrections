// CarMaintenanceViewModel.swift
import Foundation

class CarMaintenanceViewModel: ObservableObject {
    @Published var appointments: [ServiceAppointment] = []
    
    func addAppointment(serviceName: String, date: Date, description: String) {
        let newAppointment = ServiceAppointment(serviceName: serviceName, date: date, description: description)
        appointments.append(newAppointment)
    }
    
    func removeAppointment(at index: Int) {
        appointments.remove(at: index)
    }
}
