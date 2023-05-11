# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first

sky=User.create(displayname: "Skylar S", password: 'password', username: "skyfox93", bio:' cool guy')

gabby=User.create(displayname:"Gabby", password: 'password', username:'gabby559', bio: 'hipster')

ji=User.create(displayname:"ji", password_digest: 'password', username:'jister', bio: 'ganster')

fred=User.create(displayname:"freddy", password_digest: 'password', username:'fredster', bio: 'boring as heck')

Friendship.create(follower: User.first, followee: User.second, accepted: true)
Friendship.create(follower: User.third, followee: User.first, accepted: true)
Friendship.create(follower: User.fourth, followee: User.first, accepted: false)


