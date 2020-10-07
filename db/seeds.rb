# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
[
  {
    id: 1,
    name: 'team a',
    leader_name:'leader b',
    phone_number: '0123456789',
    email: 'test1@gmail.com',
    level_type: 1,
    password_digest: 'password'
  },
  {
    id: 2,
    name: 'team b',
    leader_name:'leader b',
    phone_number: '0123456789',
    email: 'test2@gmail.com',
    level_type: 1,
    password_digest: 'password'
  }
].each do |team_hash|
  team = Team.find_or_initialize_by(id: team_hash[:id])
  team.name = team_hash[:name]
  team.leader_name  = team_hash[:leader_name]
  team.phone_number = team_hash[:phone_number]
  team.email = team_hash[:email]
  team.level_type = team_hash[:level_type]
  team.password_digest = team_hash[:password_digest]
  team.save!
end


[
  {
    id: 1,
    team_id: 1,
    prefecture: 1,
    address: '新宿区',
    level_type: 1,
    start_at: Time.zone.parse('2020-10-08 19:00:00'),
    end_at:  Time.zone.parse('2020-10-08 19:00:00'),
    comment: '宜しくお願い致します。',
    
  },
  {
    id: 2,
    team_id: 2,
    prefecture: 2,
    address: '新宿区',
    level_type: 1,
    start_at: Time.zone.parse('2020-10-08 19:00:00'),
    end_at:  Time.zone.parse('2020-10-08 19:00:00'),
    comment: '宜しくお願い致します。',
    
  }
].each do |recruits_hash|
  recruit = Recruit.find_or_initialize_by(id: recruits_hash[:id])
  recruit.team_id = recruits_hash[:team_id]
  recruit.prefecture  = recruits_hash[:prefecture]
  recruit.address = recruits_hash[:address]
  recruit.level_type = recruits_hash[:level_type]
  recruit.start_at = recruits_hash[:start_at]
  recruit.end_at = recruits_hash[:end_at]
  recruit.comment = recruits_hash[:comment]
  recruit.save!
end