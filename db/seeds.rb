cities = [["Paris","75000"],["Marseille","13000"],["Lyon","69000"],["Toulouse", "31000"],["Nice","06000"],["Nantes","44000"],["Montpellier","34000"],["Strasbourg","67000"],["Bordeaux","33000"],["Lille", "59000"]]

tags = ["Communauté","Bromance","Corporate","Débat","Actualités","Annonces","Questions/Demandes"]

cities.size.times do |i|
City.create(name: cities[i][0],
    zip_code: cities[i][1])
  end
tags.size.times do |i|
Tag.create(title: tags[i])
  end
