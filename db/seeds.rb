# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
user = User.create(login: 'admin', email: 'admin@admin', password: '123')
manager = Manager.create(user_id: user.id, first_name: 'Admin', last_name: 'Admin', phone: '+7(999)111-22-33')

Country.create(name: 'Russia')
Country.create(name: 'USA')
Country.create(name: 'UK')
Country.create(name: 'Germany')
Country.create(name: 'France')

Language.create(name: 'Russian')
Language.create(name: 'English')
Language.create(name: 'German')
Language.create(name: 'French')

AccentType.create(name: 'Russian')
AccentType.create(name: 'American')
AccentType.create(name: 'English')
AccentType.create(name: 'German')
AccentType.create(name: 'French')

