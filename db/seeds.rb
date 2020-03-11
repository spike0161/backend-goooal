require 'rest-client'
require 'json'
require 'byebug'

Team.destroy_all
User.destroy_all



goal_key = Rails.application.credentials.goooal[:api_key]
goal_response = RestClient.get("http://api.football-data.org/v2/competitions/2021/teams", {"X-Auth-Token" => "#{goal_key}"})
response = JSON.parse(goal_response)

teams_array = response["teams"]


teams_array.each do |team|

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

Team.create(full_name: full_name, short_name: short_name, tla: tla_name, crestUrl: crestUrl, address: address, phone: phone, website: website, email: email, founded: founded, club_colors: club_colors, venue: venue)
end

# byebug
User.create(username: "Dean88", name: "Dean Hildebrand")
