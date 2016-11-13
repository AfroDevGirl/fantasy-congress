# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

politicians = HTTParty.get('https://www.govtrack.us/api/v2/role?current=true&limit=600')
bills = HTTParty.get('https://www.govtrack.us/api/v2/bill?congress=114')
votes = HTTParty.get('https://www.govtrack.us/api/v2/vote/?congress=114&limit=1800')

the_league = League.create!(name: "Anthony's Wienies")

alexis = User.create!(username: "alexis", email: "alexis@test.com", password: "tester", league_id: the_league.id) 
rudy = User.create!(username: "rudy", email: "rudy@test.com", password: "tester", league_id: the_league.id)
david = User.create!(username: "david", email: "david@test.com", password: "tester", league_id: the_league.id)
stephen = User.create!(username: "stephen", email: "stephen@test.com", password: "tester", league_id: the_league.id)

1767.times do |index|
    Vote.create!(congressional_vote_id: votes["objects"][index])
end 
    
540.times do |index|
    current_politician = politicians["objects"][index]
    
   Politician.create!(current: current_politician["current"],
        end_date: current_politician["enddate"],
        party: current_politician["party"],
        first_name: current_politician["person"]["firstname"],
        gender: current_politician["person"]["gender"],
        photo_id: current_politician["person"]["id"],
        last_name: current_politician["person"]["lastname"],
        middle_name: current_politician["person"]["middlename"],
        twitter_id: current_politician["person"]["twitterid"], 
        role_type: current_politician["role_type"], 
        senator_rank: current_politician["senator_rank"],
        start_date: current_politician["startdate"], 
        state: current_politician["state"], 
        title: current_politician["title_long"]) 
end

100.times do |index|
    current_bill = bills["objects"][index]
    bill_sponsor = Politician.find_by(photo_id: current_bill["sponsor"]["id"])
    
    Bill.create!(
        bill_type_label: current_bill["bill_type_label"],
        current_status: current_bill["current_status"],
        current_status_date: current_bill["current_status_date"],
        congress_number: current_bill["congress"],
        introduced_date: current_bill["introduced_date"],
        politician_id: bill_sponsor.id,
        bill_number: current_bill["number"], 
        is_alive: current_bill["is_alive"], 
        is_current: current_bill["is_current"])
end 



users = User.all()
senators = Politician.where(role_type: "senator")
representatives = Politician.where(role_type: "representative")

users.each do |user|
    LeagueUser.create!(league_id: the_league.id,user_id: user.id)
    team = user.username + "'s team"
    
    2.times do 
        senator = senators.sample
        UserPolitician.create!(user_id: user.id, politician_id: senator.id, team_name: team)
    end 
    
    8.times do 
       rep = representatives.sample
       UserPolitician.create!(user_id: user.id, politician_id: rep.id, team_name: team)
    end
end

match1 = Match.create!(player_a_id: alexis.id, player_b_id: rudy.id)
match2 = Match.create!(player_a_id: stephen.id, player_b_id: david.id)

