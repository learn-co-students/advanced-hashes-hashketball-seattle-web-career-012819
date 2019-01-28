# Write your code here!
def game_hash()
  game = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
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
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
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

def num_points_scored(name)
  hash_info = game_hash()

  hash_info.each do |team, team_info|
    team_info.each do |info, players|
      if info == :players
        players.each do |player, player_info|
          if player == name
            #puts "its equal"
            return hash_info[team][info][player][:points]
          end
        end
      end
    end
  end
end

def shoe_size(name)
  hash_info = game_hash()

  hash_info.each do |team, team_info|
    team_info.each do |info, players|
      if info == :players
        players.each do |player, player_info|
          if player == name
            #puts "its equal"
            return hash_info[team][info][player][:shoe]
          end
        end
      end
    end
  end
end

def team_colors(team_name)
  hash_info = game_hash()

  hash_info.each do |team, team_info|
    team_info.each do |info, data|
      if data == team_name
        return hash_info[team][:colors]
      end
    end
  end

end

def team_names()
  hash_info = game_hash()

  teams = hash_info.keys()
  teams.collect do |team|
    hash_info[team][:team_name]
  end
end

def player_numbers(team_name)
  hash_info = game_hash()
  player_numbers = []

  hash_info.each do |team, team_info|
    team_info.each do |team_key, team_value|
      if team_value == team_name
        players = team_info[:players]
        players.each do |player, player_info|
            player_numbers.push(player_info[:number])
        end
      end
    end
  end

  player_numbers
end

def player_stats(name)
  hash_info = game_hash()

  hash_info.each do |team, team_info|
    team_info.each do |info, players|
      if info == :players
        players.each do |player, player_info|
          if player == name
            return player_info
          end
        end
      end
    end
  end
end

def big_shoe_rebounds
   hash_info = game_hash()
   max = 0
   rebounds = -1

  hash_info.each do |team, team_info|
    team_info.each do |info, players|
      if info == :players
        players.each do |player, player_info|
          shoe_size = hash_info[team][info][player][:shoe]
          if shoe_size > max
            max = shoe_size
            rebounds = hash_info[team][info][player][:rebounds]
          end
        end
      end
    end
  end
  rebounds
end
