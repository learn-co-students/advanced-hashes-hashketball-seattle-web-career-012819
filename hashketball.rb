#require "pry"

def game_hash
  game = {}
  game[:home] = {team_name: "Brooklyn Nets", colors: ["Black", "White"], players: {}}
  game[:away] = {team_name: "Charlotte Hornets", colors: ["Turquoise", "Purple"], players: {}}
  
  game[:home][:players] = {
    "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
    "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
    "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
    "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
    "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
  }
  
  game[:away][:players] = {
      "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
    }
    
  game
end

def num_points_scored(player_name)
  game_hash.each do |location, team_info|
    game_hash[location][:players].each do |player, stats|
      if player == player_name
        return game_hash[location][:players][player][:points]
      end
    end
  end
end

def shoe_size (player_name)
  game_hash.each do |location, team_info|
    game_hash[location][:players].each do |player, stats|
      if player == player_name
        return game_hash[location][:players][player][:shoe]
      end
    end
  end
end

def team_colors (team)
  game_hash.each do |location, team_info|
    if game_hash[location][:team_name] == team
        return game_hash[location][:colors]
    end  
  end    
end    

def team_names
  array_of_teams = []
  game_hash.each do |location, team_info|
    array_of_teams << game_hash[location][:team_name]
  end 
  array_of_teams
end
  
def player_numbers(team)
  jersey_array = []
  game_hash.each do |location, team_info|
    if game_hash[location][:team_name] == team
      game_hash[location][:players].each do |player, stats|
        jersey_array << game_hash[location][:players][player][:number]
      end
    end
  end
  jersey_array
end
  
def player_stats(player_name)
  game_hash.each do |location, team_info|
    game_hash[location][:players].each do |player, stats|
      if player_name == player
        return stats
      end
    end
  end
end
  
def big_shoe_rebounds 
  
  def biggest_shoe
    big_shoe = 0
    possible_bigfoot = []
    game_hash.each do |location, team_info|
      game_hash[location][:players].each do |player, stats|
        if game_hash[location][:players][player][:shoe] > big_shoe
          big_shoe = game_hash[location][:players][player][:shoe] 
          possible_bigfoot << player
        end
      end
    end
    possible_bigfoot.pop
  end
  
  def number_of_rebounds(name)
    game_hash.each do |location, team_info|
      game_hash[location][:players].each do |player, stats|
        if player == name
         return game_hash[location][:players][player][:rebounds]
        end
      end
    end
  end
  
  number_of_rebounds(biggest_shoe)
  
end
    
    
  