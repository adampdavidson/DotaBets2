User.destroy_all
Project.destroy_all

user = User.create!(first_name: "John", last_name: "Doe", email: "john@doe.com", password: "password")

50.times do |i|
  project1 = user.projects.create!(title: "Match #{i+1}", team1: "Liquid", team2: "Alliance",
    description: "description #{i+1}", goal: 13000, matchtime: DateTime.new(2009,9,1,17))
end