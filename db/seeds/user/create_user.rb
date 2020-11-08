require 'faker'

puts "Create Role"

roles = ["Patient", "Nurse"]

roles.each do |role|
  add_role = Role.create(
    name: role
  )



  puts "Create User"
  4.times {
    puts "Create User"
      #User.create(
        #role: add_role,
        #email: Faker::Internet.email,
        #username: Faker::Name.unique.name.downcase,
        #password: "password123"
        #nip: Faker::Number.loading_zero_number(digits: 10),
        #first_name: Faker::Name.first_name,
        #last_name: Faker::Name.last_name,
        #honorific: Faker::Job.field,
        #academic_degree: Faker::Job.education_level,
        #date_birth: Faker::Date.between(from: '1982-09-23', to: '2000-09-25'),
        #gender: Faker::Gender.full.downcase,
        #postal_code:  Faker::Postal_code,
        #address: Faker::Address.full_address,
        #rt_number: Faker::Number.loading_zero_number(digits: 2),
        #rw_number: Faker::Number.loading_zero_number(digits: 2),
        #medical_staff: Faker::Number.between(from: 1, to: 2)
      #)
  }
end



