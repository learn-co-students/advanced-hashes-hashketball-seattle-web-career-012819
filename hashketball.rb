require 'pry'

def game_hash
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => { :number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1 },
        "Reggie Evans" => { :number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7 },
        "Brook Lopez" => { :number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15 },
        "Mason Plumlee" => { :number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5 },
        "Jason Terry" => { :number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1 }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => { :number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2 },
        "Bismak Biyombo" => { :number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10 },
        "DeSagna Diop" => { :number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5 },
        "Ben Gordon" => { :number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0 },
        "Brendan Haywood" => { :number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12 }
      }
    }
  }
end

def num_points_scored(player)
  points_scored = 0
  game_hash[:home][:players].each do |player_name, player_info_hash|
    # player_name = home game player names string(key), player_info_hash = player_info_hash = :number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
    if player == player_name
			points_scored = player_info_hash[:points]
		end
	end
	game_hash[:away][:players].each do |player_name, player_info_hash|
		if player == player_name
			points_scored = player_info_hash[:points]
		end
	end
	points_scored
end
# num_points_scored("Reggie Evans") # => 12

def shoe_size(player)
  shoe_size = 0
  	game_hash[:home][:players].each do |player_name, player_hash|
    	if player == player_name
			shoe_size = player_hash[:shoe]
		end
	end
	game_hash[:away][:players].each do |player_name, player_hash|
		if player == player_name
			shoe_size = player_hash[:shoe]
		end
	end
	shoe_size
end
# shoe_size("Mason Plumlee") # => 19

def team_colors(team)
  # PREVIOUS SOLUTION
  # if game_hash[:home][:team_name] == team
	# 	team_colors = game_hash[:home][:colors]
	# elsif game_hash[:away][:team_name] == team
	# 	team_colors = game_hash[:away][:colors]
	# end
  game_hash.each do |location, team_info_hash|
    # location = :home,:away; players_hash = :team_name, :colors, :players
    return team_info_hash[:colors] if team_info_hash[:team_name] == team
  end
end
# team_colors("Brooklyn Nets") # => "Black", "White"

def team_names
  teams = []
  teams << game_hash[:home][:team_name] << game_hash[:away][:team_name]
end
# team_name # => ["Brooklyn Nets", "Charlotte Hornets"]

def player_numbers(team)
  numbers = []
	if team == "Brooklyn Nets"
		game_hash[:home][:players].each do |player_name, player_info_hash|
      # player_name = home game player names string(key), player_info_hash = player_info_hash = :number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
			numbers << player_info_hash[:number]
		end
		return numbers.sort
	else team == "Charlotte Hornets"
			game_hash[:away][:players].each do |player_name, player_info_hash|
			numbers << player_info_hash[:number]
		end
		return numbers.sort
	end
end
# player_numbers("Brooklyn Nets") # => [0, 1, 11, 30, 31]

def player_stats(player)
  game_hash.each do |location, team_info_hash|
    # location = :home,:away; players_hash = :team_name, :colors, :players
    team_info_hash[:players].each do |player_name, player_info_hash|
      # player_name = "Jeff Adrian" ect., player_info_hash = :number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
      if player_name == player
        return player_info_hash
      end
    end
  end
end
# player_stats("Bismak Biyombo") # => {:number=>0, :shoe=>16, :points=>12, :rebounds=>4, :assists=>7, :steals=>7, :blocks=>15, :slam_dunks=>10}

def big_shoe_rebounds
  # returns the number of rebounds of the player with the biggest shoe size
  # Mason Plumlee	:shoe => 19	:rebounds => 12
  biggest_shoe = 19
  player_biggest_shoe = ""
  game_hash.each do |location, team_info_hash|
    # location = :home,:away; players_hash = :team_name, :colors, :players
    team_info_hash[:players].each do |player_name, player_info_hash|
      # player_name = "Jeff Adrian" ect., player_info_hash = :number, :shoe, :points, :rebounds, :assists, :steals, :blocks, :slam_dunks
      player_biggest_shoe = player_name if player_info_hash[:shoe] == biggest_shoe
      return player_info_hash[:rebounds] if player_name == player_biggest_shoe
    end
  end
end
# => big_shoe_rebounds = 12
