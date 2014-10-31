require 'faker'

# 10.times {
# 	Note.create!(title: Faker::Lorem.word, content: Faker::Lorem.sentence)
# }

user1 = User.create!(username: "john", password: "lin")
user2 = User.create!(username: "apple", password: "seed")


6.times {
  user1.notes.create!(title: Faker::Lorem.word, content: Faker::Lorem.sentence)
}

3.times {
  user2.notes.create!(title: Faker::Lorem.word, content: Faker::Lorem.sentence)
}

