require 'rest-client'
require 'json'
require 'byebug'

User.destroy_all




goal_key = Rails.application.credentials.goooal[:api_key]
goal_response = RestClient.get("http://api.football-data.org/v2/competitions/2021/teams", {"X-Auth-Token" => "#{goal_key}"})
response = JSON.parse(goal_response)
teams_array = response["teams"]

slicedArr = teams_array.slice(20,2)
# method is sleep to wait for x amount of seconds
slicedArr.each do |team|
# byebug
puts "fetching team #{team['id']}"
full_name = team['name']
short_name = team['shortName']
tla_name = team['tla']
crestUrl = team['crestUrl']
address = team['address']
phone = team['phone']
website = team['website']
email = team['email']
founded = team['founded']
club_colors = team['clubColors']
venue = team['venue']

team  = Team.find_or_create_by(full_name: full_name, short_name: short_name, tla: tla_name, crestUrl: crestUrl, address: address, phone: phone, website: website, email: email, founded: founded, club_colors: club_colors, venue: venue)
puts "team created #{team['full_name']}"

players_response = RestClient.get("http://api.football-data.org/v2/teams/#{team['id']}",{"X-Auth-Token" => "#{goal_key}"})
p_res = JSON.parse(players_response)
player_array = p_res["squad"]

player_array.each do |player|
name = player["name"]
position = player["position"]
date_of_birth = player["dateOfBirth"]
nationality = player["nationality"]
shirt_number = player["shirtNumber"]
role = player["role"]

Player.find_or_create_by(name: name, position: position, date_of_birth: date_of_birth, nationality: nationality, shirt_number: shirt_number, role: role, team_id: team.id)
  end
end

# byebug
User.create(username: "Dean88", name: "Dean Hildebrand")

0
