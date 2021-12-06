# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(email:'admin@gmail.com',password:"123123",role:"admin")
User.create(email:'assistant@gmail.com',password:"123123",role:"assistant")
User.create(email:'watcher@gmail.com',password:"123123",role:"watcher")

prof=Professional.create(name:'JuanCarlos')
prof2=Professional.create(name:'MarcosKeller')

Appointment.create(name:"Marcos",	surname:"Manuel",	phone:123123,	date:"2022-12-06 09:17:00 UTC",notes:"",professional:
  prof)
Appointment.create(name:"Juan",	surname:"Pedro",	phone:123123,	date:"2022-1-06 014:17:00 UTC",notes:"",professional:
  prof2)
Appointment.create(name:"Marcos",	surname:"Manuel",	phone:123123,	date:"2022-2-06 01:17:00 UTC",notes:"",professional:
  prof2)
Appointment.create(name:"Marta",	surname:"Dias",	phone:123123,	date:"2022-1-07 12:17:00 UTC",notes:"",professional:
  prof)
Appointment.create(name:"Oscar",	surname:"Manuel",	phone:123123,	date:"2022-4-08 11:17:00 UTC",notes:"",professional:
  prof)
Appointment.create(name:"Orlando",	surname:"Dorge",	phone:123123,	date:"2022-12-10 09:17:00 UTC",notes:"",professional:
  prof2)
Appointment.create(name:"Marcos",	surname:"Manuel",	phone:123123,	date:"2022-12-12 09:17:00 UTC",notes:"",professional:
  prof)
Appointment.create(name:"Marcos",	surname:"Manuel",	phone:123123,	date:"2022-2-30 09:17:00 UTC",notes:"",professional:
  prof2)
Appointment.create(name:"Orlando",	surname:"Dias",	phone:123123,	date:"2022-32-08 10:17:00 UTC",notes:"",professional:
  prof)
Appointment.create(name:"Mariano",	surname:"Collazo",	phone:123123,	date:"2022-2-09 08:17:00 UTC",notes:"",professional:
  prof2)
Appointment.create(name:"Marcos",	surname:"Manuel",	phone:123123,	date:"2022-12-16 06:17:00 UTC",notes:"",professional:
  prof)
Appointment.create(name:"Marcos",	surname:"Manuel",	phone:123123,	date:"2022-11-16 06:17:00 UTC",notes:"",professional:
  prof2)