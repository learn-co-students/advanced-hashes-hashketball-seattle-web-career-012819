# Write your code here!
def game_hash
  {:home => {
    :team_name => 'Brooklyn Nets',
    :colors => ['black', 'white'],
    :players => [
      {player_name: 'Alan Anderson', number: 0, shoe: 16, points: 22, rebounds: 12, assists: 12, steals: 3, blocks: 1, slam_dunks: 1},
      {player_name: 'Reggie Evans', number: 30, shoe: 14, points: 12, rebounds: 12, assists: 12, steals: 12, blocks: 12, slam_dunks: 7},
      {player_name: 'Brook Lopez', number: 11, shoe: 17, points: 17, rebounds: 19, assists: 10, steals: 3, blocks: 1, slam_dunks: 15},
      {player_name: 'Mason Plumlee', number: 1, shoe: 19, points: 26, rebounds: 12, assists: 6, steals: 3, blocks: 8, slam_dunks: 5},
      {player_name: 'Jason Terry', number: 31, shoe: 15, points: 19, rebounds: 2, assists: 2, steals: 4, blocks: 11, slam_dunks: 1}
      ]
    },
  :away => {
    :team_name => 'Charlotte Hornets',
    :colors => ['turquoise', 'purple'],
    :players => [
      {player_name: 'Jeff Adrien', number: 4, shoe: 18, points: 10, rebounds: 1, assists: 1, steals: 2, blocks: 7, slam_dunks: 2},
      {player_name: 'Bismak Biyombo', number: 0, shoe: 16, points: 12, rebounds: 4, assists: 7, steals: 7, blocks: 15, slam_dunks: 10},
      {player_name: 'DeSagna Diop', number: 2, shoe: 14, points: 24, rebounds: 12, assists: 12, steals: 4, blocks: 5, slam_dunks: 5},
      {player_name: 'Ben Gordon', number: 8, shoe: 15, points: 33, rebounds: 3, assists: 2, steals: 1, blocks: 1, slam_dunks: 0},
      {player_name: 'Brendan Haywood', number: 33, shoe: 15, points: 6, rebounds: 12, assists: 12, steals: 22, blocks: 5, slam_dunks: 12}
      ]
    }
  }
end

def num_points_scored(player_name)
  game_hash.each do |team_name, team_info| #iterate the top level of the hash
      team_info[:players].each do |player_|#iterate the symbol :players to get player names and points
      if player_[:player_name] == player_name #if name matches the argument name then return the points
          return player_[:points]
      end
    end
end
end

def shoe_size(player_name)
  game_hash.each do |team_name, team_info| #iterate the top level of the hash
      team_info[:players].each do |player_|#iterate the symbol :players to get player names and points
      if player_[:player_name] == player_name #if name matches the argument name then return the shoes size
          return player_[:shoe]
      end
    end
end
end

def team_colors(team)
  game_hash.each do |team_, team_info| #iterate the hash to find the matching team name then return the color as capitalize words
    if team_info[:team_name] == team
      return team_info[:colors].map(&:capitalize)
    end
  end
end

def team_names
  return game_hash.collect {|team, info| info[:team_name]}#return two team names
end

def player_numbers(team)
  array =[]
  game_hash.each do |team_, team_info|
    if team_info[:team_name] == team #iterate the hash to get number information
      team_info[:players].each do |player_|
        array.push(player_[:number]) #push the numbers to a new array then return the array
    end
  end
end
return array
end

def player_stats(stats)
  game_hash.each do |team_, team_info|
      team_info[:players].each do |player|
        if player[:player_name] == stats
          return player.delete_if { |names, stat| [:player_name].include?(names)}#delete the key names and return the stat numbers
        end
      end
    end
end

def big_shoe_rebounds
  biggest_size = 0
  rebound = 0
  game_hash.each do |team_, team_info|
    team_info[:players].each do |player|
      size = player[:shoe]
      if size > biggest_size #everytime a larger size if found, assign it to the biggest_size variable
        biggest_size = size
        rebound = player[:rebounds]#get the rebounds of the shoe biggest_size player 
      end
    end
  end
  return rebound
end
