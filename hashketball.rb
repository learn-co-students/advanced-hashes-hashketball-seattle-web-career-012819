require "pry"

# NOTE: all of this code assumes there will always be exactly two teams, with
# keys :home and :away

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: [
        "Black",
        "White"
      ],
      players: {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: [
        "Turquoise",
        "Purple"
      ],
      players: {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10
        },
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12
        }
      }
    }
  }
end

def num_points_scored(player_name)
  return player_stats(player_name)[:points]
end

def shoe_size(player_name)
  return player_stats(player_name)[:shoe]
end

def team_stats(team_name)
  # check if team is home team
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home]
    # if not home team, must be away team
  else
    return game_hash[:away]
  end
end

def team_colors(team_name)
  return team_stats(team_name)[:colors]
end

def team_names
  return [game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team_name)
  return team_stats(team_name)[:players].map{|name, stats| stats[:number]}
end

def player_stats(player_name)
  # look for player in home team
  player_list = game_hash[:home][:players].find{|name, stats| name == player_name}
  # if we didn't find them in the home team, check the away team
  # (this is faster than combining the two player lists)
  if !player_list
    player_list = game_hash[:away][:players].find{|name, stats| name == player_name}
  end
  # "find" creates a list, where the first element is the player name and the
  # second is the hash of stats
  return player_list[1]
end

def big_shoe_rebounds
  # starting out at 0 based on assumption that shoe size will never be smaller
  biggest_shoe = 0
  rebounds = nil

  # I could make one overall list of players, because it doesn't really matter
  # which team the player is on, but I prefer to avoid that extra computation

  # look for biggest shoe in home team
  game_hash[:home][:players].each do |name, stats|
      if stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end
  end

  # also look in away team
  game_hash[:away][:players].each do |name, stats|
      if stats[:shoe] > biggest_shoe
        biggest_shoe = stats[:shoe]
        rebounds = stats[:rebounds]
      end
  end
  return rebounds
end
