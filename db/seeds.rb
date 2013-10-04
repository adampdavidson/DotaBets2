User.destroy_all
Project.destroy_all

user = User.create!(username: "Admin", email: "john@doe.com", password: "145773", admin: 1)

50.times do |i|
  project1 = user.projects.create!(title: "Match #{i+1}", team1: "Liquid", team2: "Alliance",
    description: "description #{i+1}", goal: 13000, matchtime: DateTime.new(2009,9,1,17))
end