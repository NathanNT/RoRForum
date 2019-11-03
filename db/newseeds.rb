require 'faker'

users = []
cities = []
gossips = []
tags = []
messages = []
likes = []
comments = []
commentssecond = []

10.times do |x|
  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code)
  cities << city
  puts "Création de la ville nb°#{x}"
end


10.times do |x|
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: rand(16..80),
    city_id: cities[rand(0..10-1)].id)
  users << user
puts "Création de l'utilisateur nb°#{x}"
end

20.times do |x|
  gossip = Gossip.create(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
      user_id: rand(1..10))
  gossips << gossip
puts "Création du gossip nb°#{x}"
end

10.times do |x|
  tag = Tag.create(
    title: Faker::Book.genre)
  tags << tag
  puts "Création du tag nb°#{x}"
end


10.times do |x|
  GossipTag.create(
      gossip_id: gossips[rand(0..20-1)],
      tag_id: tags[rand(0..10-1)].id)
      puts "ajout d'un tag nb°#{x}"
end


20.times do |x|
  message = PrivateMessage.create(
    sender_id: users[rand(0..10-1)].id,
    content: Faker::Lorem.paragraph)
  messages << message
end

20.times do |x|
  message = RecipientList.create(
    private_message_id: messages[x].id,
    recipient_id: users[rand(0..10-1)].id)
  messages << message
end

20.times do |x|
  message = RecipientList.create(
    private_message_id: messages[rand(0..20-1)].id,
    recipient_id: users[rand(0..10-1)].id)
  messages << message
end

50.times do |x|
  comment = Comment.create(
      content: Faker::Lorem.paragraph,
      user_id: users[rand(0..10-1)].id,
      gossip_id: gossips[rand(0..20-1)].id)
  comments << comment
    puts "ajout d'un commentaire nb°#{x}"
end







