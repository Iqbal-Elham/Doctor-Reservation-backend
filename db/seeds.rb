# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


print "start"

# Create some doctors
doctor1 = Doctor.create(name: 'Dr. John Doe')
doctor2 = Doctor.create(name: 'Dr. Jane Smith')

# Create some patients
patient1 = Patient.create(name: 'Alice')
patient2 = Patient.create(name: 'Bob')

# Create some reservations with appointment_time
Reservation.create(patient_id: patient1.id, doctor_id: doctor1.id, city: 'New York', appointment_time: Time.now + 1.day)
Reservation.create(patient_id: patient1.id, doctor_id: doctor2.id, city: 'Los Angeles', appointment_time: Time.now + 2.days)
Reservation.create(patient_id: patient2.id, doctor_id: doctor1.id, city: 'Chicago', appointment_time: Time.now + 3.days)
Reservation.create(patient_id: patient2.id, doctor_id: doctor2.id, city: 'San Francisco', appointment_time: Time.now + 4.days)

print "end"
