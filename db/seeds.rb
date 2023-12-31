# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


print "start"

# Create some doctors
Doctor.create(name: "Ahmad", photo: "https://okeydoc.ru/wp-content/uploads/2018/05/5435.jpg", about: "I am a professional Pediatrician with years of experience.", price_hour: 500)
Doctor.create(name: "Jackson", photo: "https://factroom.ru/wp-content/uploads/2017/09/Depositphotos_39179963_l-2015.jpg", about: "I am a professional Neurologist with years of experience.", price_hour: 800)
Doctor.create(name: "Mike", photo: "https://www.tubefilter.com/wp-content/uploads/2018/07/doctor-mike-1920x1131.jpg", about: "I am a junior Surgeon, but I have a solid understanding of what I do.", price_hour: 400)
Doctor.create(name: "Grealish", photo: "https://avatars.dzeninfra.ru/get-zen_doc/1707354/pub_5ddbd85a1f4cd714a41ca155_5ddbd8a3710eb34d51c349fc/scale_1200", about: "I am a junior Anesthesiologist..", price_hour: 200)
Doctor.create(name: "Abdullah", photo: "https://drtathed.com/wp-content/uploads/2021/05/doctor-scaled-1.jpg", about: "I am a professional Ophthalmologist with years of experience.", price_hour: 600)

# # Create some patients
# patient1 = Patient.create(name: 'Alice')
# patient2 = Patient.create(name: 'Bob')

# # Create some reservations with appointment_time
# Reservation.create(patient_id: patient1.id, doctor_id: doctor1.id, city: 'New York', appointment_time: Time.now + 1.day)
# Reservation.create(patient_id: patient1.id, doctor_id: doctor2.id, city: 'Los Angeles', appointment_time: Time.now + 2.days)
# Reservation.create(patient_id: patient2.id, doctor_id: doctor1.id, city: 'Chicago', appointment_time: Time.now + 3.days)
# Reservation.create(patient_id: patient2.id, doctor_id: doctor2.id, city: 'San Francisco', appointment_time: Time.now + 4.days)

print "end"
