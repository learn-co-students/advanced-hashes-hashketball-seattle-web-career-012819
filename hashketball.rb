require "pry"

def game_hash
	hash_out = {
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
				}
			}
		}
	}
end

def num_points_scored(player_name)
	points_to_return = nil
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					if team_mate == player_name
						stat_hash.each do |stat, stat_val|
							if stat == :points && points_to_return == nil
								points_to_return = stat_val
							end
						end
					end
				end
			end
		end
	end
	points_to_return
end

def shoe_size(player_name)
	shoe_to_return = nil
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					if team_mate == player_name
						stat_hash.each do |stat, stat_val|
							if stat == :shoe && shoe_to_return == nil
								shoe_to_return = stat_val
							end
						end
					end
				end
			end
		end
	end
	shoe_to_return
end

def team_colors(team_search)
	colors_to_return = nil
	team_found = false
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if data_item == team_search && team_found == false
				team_found = true
			else
				if team_found && team_data == :colors && colors_to_return == nil
					colors_to_return = data_item
				end
			end
		end
	end
	colors_to_return
end

def team_names
	teams = []
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :team_name
				teams << data_item
			end
		end
	end
	teams
end

def player_numbers(team_search)
	numbers_to_return = []
	team_found = false
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if data_item == team_search && team_found == false
				team_found = true
			else
				if team_found && team_data == :players
					data_item.each do |team_mate, stat_hash|
						stat_hash.each do |stat, stat_val|
							if stat == :number
								numbers_to_return << stat_val
							end
						end
					end
				end
			end
		end
		team_found = false
	end
	numbers_to_return
end

def player_stats(player_name)
	stats_to_return = nil
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					if team_mate == player_name && stats_to_return == nil
						stats_to_return = stat_hash
					end
				end
			end
		end
	end
	stats_to_return
end

def big_shoe_rebounds
	rebounds_to_return = nil
	biggest_shoe_size = []
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					update_record = false
					stat_hash.each do |stat, stat_val|
						if stat == :shoe
							if biggest_shoe_size.length < 1 || biggest_shoe_size[1][:shoe] < stat_val
								update_record = true
							end
						end
					end
					if update_record
						biggest_shoe_size = []
						biggest_shoe_size << team_mate
						biggest_shoe_size << stat_hash
						rebounds_to_return = biggest_shoe_size[1][:rebounds]
					end
				end
			end
		end
	end
	rebounds_to_return
end

def most_points_scored
	most_valuable_player = nil
	most_points = []
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					update_record = false
					stat_hash.each do |stat, stat_val|
						if stat == :points
							if most_points.length < 1 || most_points[1][:points] < stat_val
								update_record = true
							end
						end
					end
					if update_record
						most_points = []
						most_points << team_mate
						most_points << stat_hash
						most_valuable_player = most_points[0]
					end
				end
			end
		end
	end
	most_valuable_player
end

def winning_team
	champions = nil
	team_score = nil
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			update_record = false
			if team_data == :players
				player_sum = 0
				data_item.each do |team_mate, stat_hash|
					stat_hash.each do |stat, stat_val|
						if stat == :points
							player_sum += stat_val
						end
					end
				end
				if team_score == nil || player_sum > team_score
					update_record = true
					team_score = player_sum
				end
			end
			if team_data == :team_name
				if champions == nil || update_record
					champions = data_item
				end
			end
		end
	end
	champions
end

def player_with_longest_name
	name_to_check = nil
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					if name_to_check == nil || team_mate.length > name_to_check.length
						name_to_check = team_mate
					end
				end
			end
		end
	end
	name_to_check
end

def long_name_steals_a_ton?
	longest_name = player_with_longest_name
	longest_steals = nil
	other_steals = nil
	game_hash.each do |team, team_hash|
		team_hash.each do |team_data, data_item|
			if team_data == :players
				data_item.each do |team_mate, stat_hash|
					stat_hash.each do |stat, stat_val|
						if stat == :steals
							if team_mate == longest_name
								if longest_steals == nil
									longest_steals = stat_val
								end
							else
								if other_steals == nil || other_steals < stat_val
									other_steals = stat_val
								end
							end
						end
					end
				end
			end
		end
	end
	longest_steals > other_steals
end