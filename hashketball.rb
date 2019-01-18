require 'pry'

def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: %w(Black White),
      players: {
        "Alan Anderson" => {number: 0, shoe: 16, points: 22, rebounds: 12,
                          assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
        "Reggie Evans" => {number: 30, shoe: 14, points: 12, rebounds: 12,
                          assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
        "Brook Lopez" => {number: 11, shoe: 17, points: 17, rebounds: 19,
                          assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
        "Mason Plumlee" => {number: 1, shoe: 19, points: 26, rebounds: 12,
                          assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
        "Jason Terry" => {number: 31, shoe: 15, points: 19, rebounds: 2,
                          assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      }
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: %w(Turquoise Purple),
      players: {
        "Jeff Adrien" => {number: 4, shoe: 18, points: 10, rebounds: 1,
                          assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
        "Bismak Biyombo" => {number: 0, shoe: 16, points: 12, rebounds: 4,
                          assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
        "DeSagna Diop" => {number: 2, shoe: 14, points: 24, rebounds: 12,
                          assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
        "Ben Gordon" => {number: 8, shoe: 15, points: 33, rebounds: 3,
                          assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
        "Brendan Haywood" => {number: 33, shoe: 15, points: 6, rebounds: 12,
                          assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      }
    }
  }
end

def num_points_scored(player)
  points = nil
  game_hash.values.each do |team|
    points = team[:players][player][:points] if team[:players][player]
  end
  points
end

def shoe_size(player)
  game_hash.values.each do |team|
    return team[:players][player][:shoe] if team[:players][player]
  end
end

def team_colors(name_of_team)
  game_hash.each do |location, team|
    return team[:colors] if team[:team_name] == name_of_team
  end
end

def team_names
  teams = []
  game_hash.each do |location, team|
    teams << team[:team_name]
  end
  teams
end

def player_numbers(name_of_team)
  jersey_no = []
  game_hash.values.each do |team|
    if team[:team_name] == name_of_team
      jersey_no = team[:players].map { |player, stats| stats[:number] }
    end
  end
  jersey_no
end

def player_stats(player_name)
  game_hash.values.each do |team|
    team[:players].each { |player, stats| return stats if player == player_name }
  end
end

def big_shoe_rebounds
  shoe_sizes = {}
  game_hash.values.each do |team|
    team[:players].each do |player, stats|
        shoe_sizes[player] = stats[:shoe]
    end
  end
  big_shoe_player = shoe_sizes.max_by { |player, size| size }[0]

  # return big_shoe_player's rebound ct
  game_hash.values.each do |team|
    return team[:players][big_shoe_player][:rebounds] if team[:players][big_shoe_player]
  end
end

def most_points_scored
  points_scored = {}
  game_hash.values.each do |team|
    team[:players].each do |player, stats|
      points_scored[player] = stats[:points]
    end
  end

  points_scored.max_by { |player, points| points }[0]
end

def winning_team
  scores = {}

  game_hash.values.each do |team|
    team_score = team[:players].map { |player, stats| stats[:points] }.sum
    scores[team[:team_name]] = team_score
  end

  scores.max_by { |team, score| score}[0]
end

def player_with_longest_name
  all_player_names = game_hash.flat_map { |location, team| team[:players].keys }
  all_player_names.max_by { |name| name.length }
end

def long_name_steals_a_ton?
  # determine player with most steals
  balls_stolen = {}
  game_hash.values.each do |team|
    team[:players].each { |player, stats| balls_stolen[player] = stats[:steals] }
  end
  most_steals = balls_stolen.max_by { |player, steals| steals }[0]

  most_steals == player_with_longest_name
end
