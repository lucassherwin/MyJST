# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.create(first_name: 'Lucas', last_name: 'Sherwin', username: 'username', email: 'email@email.com', password: 'pass')

Job.create(title: 'seed job', company: 'company', status: 'applied', contact: 'person', user_id: user.id)

Task.create(title: 'task', body: 'this is my task', status: false, user_id: user.id)