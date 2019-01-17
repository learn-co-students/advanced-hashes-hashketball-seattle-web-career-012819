require 'pry'
def game_hash
  game_hash = {:home => {
    :team_name => "Brooklyn Nets",
    :colors => ["Black", "White"],
    :players => {
      "Alan Anderson" => {
        :number => 0,
        :shoe  => 16,
        :points => 22,
        :rebounds => 12,
        :assists => 12,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 1
        },
      "Reggie Evans" => {
        :number => 30,
        :shoe  => 14,
        :points => 12,
        :rebounds => 12,
        :assists => 12,
        :steals => 12,
        :blocks => 12,
        :slam_dunks => 7
        },
      "Brook Lopez" => {
        :number => 11,
        :shoe  => 17,
        :points => 17,
        :rebounds => 19,
        :assists => 10,
        :steals => 3,
        :blocks => 1,
        :slam_dunks => 15
        },
      "Mason Plumlee" => {
        :number => 1,
        :shoe  => 19,
        :points => 26,
        :rebounds => 12,
        :assists => 6,
        :steals => 3,
        :blocks => 8,
        :slam_dunks => 5
        },
      "Jason Terry" => {
        :number => 31,
        :shoe  => 15,
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
        :shoe  => 18,
        :points => 10,
        :rebounds => 1,
        :assists => 1,
        :steals => 2,
        :blocks => 7,
        :slam_dunks => 2
        },
      "Bismak Biyombo" => {
        :number => 0,
        :shoe  => 16,
        :points => 12,
        :rebounds => 4,
        :assists => 7,
        :steals => 7,
        :blocks => 15,
        :slam_dunks => 10
        },
      "DeSagna Diop" => {
        :number => 2,
        :shoe  => 14,
        :points => 24,
        :rebounds => 12,
        :assists => 12,
        :steals => 4,
        :blocks => 5,
        :slam_dunks => 5
        },
      "Ben Gordon" => {
        :number => 8,
        :shoe  => 15,
        :points => 33,
        :rebounds => 3,
        :assists => 2,
        :steals => 1,
        :blocks => 1,
        :slam_dunks => 0
        },
      "Brendan Haywood" => {
        :number => 33,
        :shoe  => 15,
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

def num_points_scored(player_name)
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          if name == player_name
            return game_hash[home_or_away][info][name][:points]
          end 
        end
      end
    end 
  end
end

def shoe_size(player_name)
    game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          if name == player_name
            return game_hash[home_or_away][info][name][:shoe]
          end 
        end
      end
    end 
  end
end 

def team_colors(teams_name)
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if contents == teams_name
      return game_hash[home_or_away][:colors]
      end
    end 
  end
end 

def team_names
  array = []
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if info == :team_name
        array << contents
      end
    end 
  end
  array
end 

def player_numbers(teams_name)
  array = []
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if info_category[:team_name] == teams_name
        if contents.is_a?(Hash)
          contents.each do |name, stats|
            array << stats[:number]
          end
        end
      end
    end 
  end
  array
end 

def player_stats(player_name)
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
        if contents.is_a?(Hash)
          contents.each do |name, stats|
            if name == player_name
              return stats
            end 
          end
        end
    end 
  end
end 

def big_shoe_rebounds
  rebounds = 0
  biggest_size = 0
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          if stats[:shoe].to_i > biggest_size.to_i
            biggest_size = stats[:shoe]
            rebounds = stats[:rebounds]
          end
        end
      end
    end 
  end
  rebounds
end 

def most_points_scored
  player_name = ""
  most_points = 0
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          if stats[:points].to_i > most_points.to_i
            most_points = stats[:points]
            player_name = name
          end
        end
      end
    end 
  end
  player_name
end 

def winning_team
  team_points = {"Brooklyn Nets" => 0, "Charlotte Hornets" => 0}
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
      if contents.is_a?(Hash)
        contents.each do |name, stats|
          team_points[game_hash[home_or_away][:team_name]] += stats[:points]
        end
      end
    end 
  end
  winning_points = 0 
  team_name = ""
  team_points.each do |name, points|
    if winning_points < points
      team_name = name
      winning_points = points
    end
  end
  team_name
end

def player_with_longest_name
  longest_name = 0
  player_name = ""
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
        if contents.is_a?(Hash)
          contents.each do |name, stats|
              if name.length > longest_name
                longest_name = name.length
                player_name = name
              end
          end
        end
    end 
  end
  player_name
end 

def long_name_steals_a_ton?
  max_steals = 0
  steals_name = ""
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
        if contents.is_a?(Hash)
          contents.each do |name, stats|
            stats.each do |statistic, value|
              if statistic == :steals && value > max_steals
                max_steals = value 
                steals_name = name
              end
            end
          end
        end
    end 
  end
  longest_name = 0
  player_name = ""
  game_hash.each do |home_or_away, info_category|
    info_category.each do |info, contents|
        if contents.is_a?(Hash)
          contents.each do |name, stats|
              if name.length > longest_name
                longest_name = name.length
                player_name = name
              end
          end
        end
    end 
  end
  player_name == steals_name
end 
