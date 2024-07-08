// ServiceAppointment.swift
import Foundation

struct ServiceAppointment: Identifiable {
    let id = UUID()
    let serviceName: String
    let date: Date
    let description: String
}
