require "pry"

def game_hash
  nested_hash = {:home => {:team_name => "Brooklyn Nets", :colors => ["Black", "White"],
    :players => {"Alan Anderson" => {:number => 0, :shoe => 16, :points => 22, :rebounds => 12, :assists => 12, :steals => 3, :blocks => 1, :slam_dunks => 1},
    "Reggie Evans" => {:number => 30, :shoe => 14, :points => 12, :rebounds => 12, :assists => 12, :steals => 12, :blocks => 12, :slam_dunks => 7},
    "Brook Lopez" => {:number => 11, :shoe => 17, :points => 17, :rebounds => 19, :assists => 10, :steals => 3, :blocks => 1, :slam_dunks => 15},
    "Mason Plumlee" => {:number => 1, :shoe => 19, :points => 26, :rebounds => 12, :assists => 6, :steals => 3, :blocks => 8, :slam_dunks => 5},
    "Jason Terry" => {:number => 31, :shoe => 15, :points => 19, :rebounds => 2, :assists => 2, :steals => 4, :blocks => 11, :slam_dunks => 1}} },
  :away => {:team_name => "Charlotte Hornets", :colors => ["Turquoise", "Purple"],
    :players => {"Jeff Adrien" => {:number => 4, :shoe => 18, :points => 10, :rebounds => 1, :assists => 1, :steals => 2, :blocks => 7, :slam_dunks => 2},
  "Bismak Biyombo" => {:number => 0, :shoe => 16, :points => 12, :rebounds => 4, :assists => 7, :steals => 7, :blocks => 15, :slam_dunks => 10},
"DeSagna Diop" => {:number => 2, :shoe => 14, :points => 24, :rebounds => 12, :assists => 12, :steals => 4, :blocks => 5, :slam_dunks => 5},
"Ben Gordon" => {:number => 8, :shoe => 15, :points => 33, :rebounds => 3, :assists => 2, :steals => 1, :blocks => 1, :slam_dunks => 0},
"Brendan Haywood" => {:number => 33, :shoe => 15, :points => 6, :rebounds => 12, :assists => 12, :steals => 22, :blocks => 5, :slam_dunks => 12}}
    }}
end

def num_points_scored(player_name)
  puntos = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |p_name, stats|
          if p_name == player_name
            stats.each do|stat, number|
              if stat == :points
                puntos << number
              else end
            end
            else end
            end
            else end
          end
end
puntos[0]
end

def shoe_size(player_name)
  zapatas = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |p_name, stats|
          if p_name == player_name
            stats.each do|stat, number|
              if stat == :shoe
                zapatas << number
              else end
            end
            else end
            end
            else end
          end
end
zapatas[0]
end

def team_colors(team)
  colores = []
    game_hash.each do |location, team_data|
       team_data.each do |attribute, data|
         if data == team
           team_data.each do |attr, dat|
             if attr == :colors
               colores << dat
             else end
             end
           else end
           end
end
colores.flatten!
end

  def team_names
    rivals = []
    game_hash.each do |location, team_data|
      team_data.each do |attribute, data|
        if attribute == :team_name
          rivals << data
        else end
  end end
  rivals
end

def player_numbers(team)
  numeros = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == team
        team_data.each do |attr, dat|
      if attr == :players
        dat.each do |p_name, stats|
            stats.each do|stat, detail|
              if stat == :number
                numeros << detail
              else end
            end
            end
            else end
            end else end
          end end
          numeros
        end

def player_stats(name)
numbas = {}
game_hash.each do |location, team_data|
  team_data.each do |attribute, data|
    if attribute == :players
      data.each do |p_name, stats|
        if p_name == name
          numbas = stats
          else end
          end
          else end
        end
end
numbas
end

def big_shoe_rebounds
false_cause = []
sizes = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |p_name, stats|
          stats.each do |categ, num|
            if categ == :shoe
              sizes << num
              sizes = sizes.sort
            else end
            end
          end
        else end
        end
      end
      game_hash.each do |location, team_data|
        team_data.each do |attribute, data|
                if attribute == :players
                  data.each do |p_name, stats|
                    stats.each do |categ, num|
                if categ == :shoe && num == sizes[-1]
              stats.each do |categ,num|
                if categ == :rebounds
                   false_cause << num
                 else end
                 end
               else end
               end
             end
             else end
             end
           end
false_cause[0]
 end
