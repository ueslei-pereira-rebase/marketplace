# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create(email: 'admin@admin.com.br', password: '123456')
company = Company.create(name:'Empresa teste', email: 'empresa@teste.com.br')
User.create(email: 'usuario@teste.com.br', password: '123456', company: company)
