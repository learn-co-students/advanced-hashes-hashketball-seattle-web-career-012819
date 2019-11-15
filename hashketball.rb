# Write your code here!
require "pry"

def game_hash

    game = {
        home: {
            team_name: "Brooklyn Nets",
            colors: ["Black", "White"],
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
            colors: ["Turquoise", "Purple"],
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
                },
            }
        }
    }
    game
end

def home_team_name
    game_hash[:home][:team_name]
end

def num_points_scored(player_name)

    points = 0
    if game_hash[:home][:players].include?(player_name)
        points = game_hash[:home][:players][player_name][:points]

    elsif game_hash[:away][:players].include?(player_name)
        points = game_hash[:away][:players][player_name][:points]
    end

    points

end

def shoe_size(player_name)

    shoe_size = 0
    if game_hash[:home][:players].include?(player_name)
        shoe_size = game_hash[:home][:players][player_name][:shoe]

    elsif game_hash[:away][:players].include?(player_name)
        shoe_size = game_hash[:away][:players][player_name][:shoe]
    end

    shoe_size

end

def team_colors(team_name)

    if game_hash[:home][:team_name] == team_name
        return game_hash[:home][:colors]

    elsif game_hash[:away][:team_name] == team_name
        return game_hash[:away][:colors]
    end

end

def team_names

    tonights_game = []

    tonights_game.push(game_hash[:home][:team_name])
    tonights_game.push(game_hash[:away][:team_name])

    tonights_game

end

def player_numbers(team_name)

    jersey_nums = []

    if game_hash[:home][:team_name] == team_name
        game_hash[:home][:players].each do |name, stats|
            stats.each do |stat, value|
                if (stat == :number)
                    jersey_nums.push(value)
                end
            end
        end
    elsif game_hash[:away][:team_name] == team_name
        game_hash[:away][:players].each do |name, stats|
            stats.each do |stat, value|
                if (stat == :number)
                    jersey_nums.push(value)
                end
            end
        end
    end
    jersey_nums
end

def player_stats(player_name)

    if game_hash[:home][:players].include?(player_name)
        return game_hash[:home][:players][player_name]

    elsif game_hash[:away][:players].include?(player_name)
        return game_hash[:away][:players][player_name]
    end

end

def big_shoe_rebounds

    home_biggest_shoe_size = nil
    home_rebounds_amt = nil

    away_biggest_shoe_size = nil
    away_rebounds_amt = nil

    game_hash[:home][:players].each do |player, data|
        data.each do |stat, value|
            if stat == :shoe
                if home_biggest_shoe_size == nil || home_biggest_shoe_size < value
                    home_biggest_shoe_size = value
                    home_rebounds_amt = game_hash[:home][:players][player][:rebounds]
                end
            end
        end
    end

    game_hash[:away][:players].each do |player, data|
        data.each do |stat, value|
            if stat == :shoe
                if away_biggest_shoe_size == nil || away_biggest_shoe_size < value
                    away_biggest_shoe_size = value
                    away_rebounds_amt = game_hash[:away][:players][player][:rebounds]
                end
            end
        end
    end

    if home_biggest_shoe_size > away_biggest_shoe_size
        return home_rebounds_amt
    elsif away_biggest_shoe_size > home_biggest_shoe_size
        return away_rebounds_amt
    end

end

def most_points_scored

    home_player_most_points = nil
    home_player = nil
    away_player_most_points = nil
    away_player = nil

    game_hash[:home][:players].each do |player, data|
        data.each do |stat, value|
            if stat == :points
                if home_player_most_points == nil || home_player_most_points < value
                    home_player_most_points = value
                    home_player = player
                end
            end
        end
    end

    game_hash[:away][:players].each do |player, data|
        data.each do |stat, value|
            if stat == :points
                if away_player_most_points == nil || away_player_most_points < value
                    away_player_most_points = value
                    away_player = player
                end
            end
        end
    end

    if home_player_most_points > away_player_most_points
        return home_player
    elsif away_player_most_points > home_player_most_points
        return away_player
    end

end

def winning_team

    home_score = 0
    away_score = 0

    game_hash[:home][:players].each do |player, data|
        data.each do |stat, value|
            if stat == :points
                home_score += value
            end
        end
    end

    game_hash[:away][:players].each do |player, data|
        data.each do |stat, value|
            if stat == :points
                away_score += value
            end
        end
    end

    if home_score > away_score
        return game_hash[:home][:team_name]
    else
        return game_has[:away][:team_name]
    end

end

