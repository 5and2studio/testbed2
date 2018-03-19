# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

g = UserGroup.create({ name: "Test Group" })
p = Permission.create({ name: "Edit User 1", verb: "edit", noun: "User", conditions: "{ \"id\": 1 }" })
g.permissions << p
p = Permission.create({ name: "Read User", verb: "read", noun: "User" })
g.permissions << p
u = User.create({ first_name: "Test", last_name: "McTesterson", email: "test@test.com", password: "Test123!" })
u.user_groups << g