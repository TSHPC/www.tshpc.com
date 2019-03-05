# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# encoding: utf-8
Occupation.delete_all
Occupation.create!(name: "Master's student") 
Occupation.create!(name: "PhD student") 
Occupation.create!(name: "Professor")
Occupation.create!(name: "Professional")

ActivityDomain.delete_all
ActivityDomain.create!(name: "Student")
ActivityDomain.create!(name: "Academia")
ActivityDomain.create!(name: "Research and Development")
ActivityDomain.create!(name: "Computer Science")
ActivityDomain.create!(name: "Data Science")
ActivityDomain.create!(name: "Artificial Intellegence")
ActivityDomain.create!(name: "Applied Science")
ActivityDomain.create!(name: "Engineering")
ActivityDomain.create!(name: "Industry")
ActivityDomain.create!(name: "Other")

Event.create!(
[
	{
  	name: "TSHPConf 2017",
  	description: "The 1st Tunisian workshop in High Performance Computing and 
                  and Artificial Intelligence that was held in collaboration
                  with ESPRIT, University of Tunis EL Manar, ARDIA and TOTAL",
  	location: "Esprit Tunis -- Tunisia",
  	starts_at: "2017-03-29 08:00:00",
  	ends_at: "2017-03-31 17:00:00",
  	price: 50.00,
  	discounted_price: 25.00
  },
  {
  	name: "TSHPConf 2018",
  	description: "The 2nd Tunisian workshop in High Performance Computing and 
                	and Artificial Intelligence that was also held in ESPRIT with 
                	the collaboration of the young professors of the University 
                	of ESPRIT",
  	location: "Esprit Tunis -- Tunisia",
  	starts_at: "2018-04-19 08:00:00",
  	ends_at: "2018-04-21 17:00:00",
  	price: 50.00,
  	discounted_price: 25.00
  }
])



