# Write your code here

require 'pry'

def game_hash
  {
    home:{
      team_name: 'Brooklyn Nets',
      colors: ['Black', 'White'],
      players: {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    away: {
      team_name: 'Charlotte Hornets',
      colors: ['Turquoise', 'Purple'],
      players:{
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def all_players
  game_hash[:home][:players].merge(game_hash[:away][:players])
end

def num_points_scored(player)
  all_players[player][:points]
end

def shoe_size(player)
  all_players[player][:shoe]
end

#returns requested teams colors, and nil if team not playing
def team_colors(team_name)
  if (team = (game_hash.values.find{|team| team[:team_name] == team_name})) then team[:colors] end
end

def team_names
  game_hash.each_value.map{|team| team[:team_name]}
end

#returns requested teams player numbers, and nil if team not playing
def player_numbers(team_name)
  if (team = (game_hash.values.find{|team| team[:team_name] == team_name})) then team[:players].values.map{|stats| stats[:number]} end
end

def player_stats(player)
  all_players[player]
end

def big_shoe_rebounds
  all_players.values.max_by{|stats| stats[:shoe]}[:rebounds]
end

#max_by returns array with key as first item (name) and value as second item (stats)
def most_points_scored
  all_players.max_by{|player,stats| stats[:points]}[0]
end

def winning_team
  game_hash.values.max_by{|info| info[:players].values.map{|player_stats| player_stats[:points]}.reduce(:+)}[:team_name]
end

def player_with_longest_name
  all_players.keys.max_by{|name| name.length}
end

def long_name_steals_a_ton?
  player_with_longest_name == all_players.max_by{|name, stats| stats[:steals]}[0]
end
# binding.pry
