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
  puts "Seeding vity nb#{x}"
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
  puts "Seeding user nb#{x}"
end

20.times do |x|
  gossip = Gossip.create(
      title: Faker::Book.title,
      content: Faker::Lorem.paragraph,
      user_id: rand(1..10))
  puts tp gossip
  gossips << gossip
  puts "mogos"
end

10.times do |x|
  tag = Tag.create(
    title: Faker::Book.genre)
  tags << tag
end

20.times do |x|
  GossipTag.create(
      gossip_id: gossips[x],
      tag_id: tags[rand(0..10-1)].id)
end

10.times do |x|
  GossipTag.create(
      gossip_id: gossips[rand(0..20-1)],
      tag_id: tags[rand(0..10-1)].id)
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
end


20.times do |x|
  like = Like.create(
    comment_id: comments[rand(0..50-1)].id)
  likes << like
end

20.times do |x|
  like = Like.create(
    gossip_id: gossips[rand(0..20-1)].id)
  likes << like
end

50.times do |x|
  comment = Comment.create(
      content: Faker::Lorem.paragraph,
      user_id: users[rand(0..10-1)].id,
      comment_id: comments[rand(0..50-1)].id)
  commentssecond << comment
end


