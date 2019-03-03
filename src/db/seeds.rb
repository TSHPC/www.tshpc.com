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







