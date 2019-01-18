require 'pry'
def game_hash()
  game_stats = {
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

def num_points_scored(player_name)
  game_hash.each do |home_away,team_info|
    team_info.each do |team_info, stat|
      if team_info == :players
        stat.each do |name, stat|
          if name == player_name
            stat.each do |stat, number|
              if stat == :points
                return number
end
end
end
end
end
end
end
end

def shoe_size(player_name)
  game_hash.each do |home_away,team_info|
    team_info.each do |team_info, stat|
      if team_info == :players
        stat.each do |name, stat|
          if name == player_name
            stat.each do |stat, number|
              if stat == :shoe
                return number
end
end
end
end
end
end
end
end

def team_colors(team_name)
  game_hash.each do |home_away,team_info|
    team_info.each do |name, data|
      if data == team_name
        team_info.each do |info, attribute|
        if info == :colors
        return attribute
end
end
end
end
end
end


def team_names
names = []
  game_hash.each do |home_way,team_info|
    team_info.each do |team_info, attribute|
      if team_info == :team_name
        names << attribute
end
end
end
names
end

def player_numbers(team_name)
numbers = []
game_hash.each do |home_away, team_info|
 team_info.each do |k,v|
  if v == team_name
  team_info.each do |players, player_names|
  if players == :players
  player_names.each do |player_names, stat|
  stat.each do |stat, value|
  if stat == :number
  numbers <<  value
end
end
end
end
end
end
end
end
numbers
end

def player_stats(name)
game_hash.each do |a, b|
b.each do |c, d|
if c == :players
d.each do |e,f|
if e == name
return f
end
end
end
end
end
end

def big_shoe_rebounds
sizes = []
game_hash.each do |a, b|
b.each do |c, d|
if c == :players
d.each do |e,f|
f.each do |g,h|
if g == :shoe
sizes << h
sizes = sizes.sort
end
end
end
end
end
game_hash.each do |a,b|
b.each do |c, d|
if c == :players
d.each do |e,f|
f.each do |g,h|
if g == :shoe && h == sizes[-1]
f.each do |h,i|
if h == :rebounds
return i
end
end
end
end
end
end
end
end
end
end

def most_points_scored
all_points = []
game_hash.each do |a, b|
b.each do |c, d|
  if c == :players
    d.each do |e,f|
      f.each do |g,h|
        if g == :points
all_points << h
all_points = all_points.sort
end
end
end
end
end
end
game_hash.each do |a,b|
b.each do |c, d|
if c == :players
d.each do |e,f|
f.each do |g,h|
if g == :points && h == all_points[-1]
return e
end
end
end
end
end
end
end 
