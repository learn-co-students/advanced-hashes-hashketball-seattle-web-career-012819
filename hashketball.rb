require "pry"

def game_hash

game_stats = {
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

game_stats

end



def shoe_size(player_name)
return_value = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_stats|
          if name == player_name
            player_stats.each do |category, value|
              if category == :shoe
                return_value = value
              end
            end
          end
        end
      end
    end
  end
return_value
end

#def team_colors(name_of_team)
#  game_hash.each do |location, team_data|
#    team_data.each do |attribute, data|
#      if data == name_of_team
#        team_colors = name_of_team
#        team_colors = data
#      end
#    end
#  end
#team_colors
#end

def team_colors(name_of_team)
colors = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == name_of_team
        colors = game_hash[location][:colors]
      end
    end
  end
colors
end

def player_stats(player_name)
return_value = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_attributes|
          if name == player_name
            return_value = player_attributes
          end
        end
      end
    end
  end
return_value
end


def player_numbers(name_of_team)
number_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if data == name_of_team
        game_hash[location][:players].each do |name, player_stat|
          player_stat.each do |category, value|
            if category == :number
              number_array << value
            end
          end
        end
      end
    end
  end
number_array
end

def big_shoe_rebounds
big_sock_rebounds = 0
biggest_shoe = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_stats|
          player_stats.each do |stat, value|
            if stat == :shoe && value > biggest_shoe
              biggest_shoe = value
              big_sock_rebounds = game_hash[location][attribute][name][:rebounds]
            end
          end
        end
      end
    end
  end
big_sock_rebounds
end



def team_names
names_array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
        names_array << data
      end
    end
  end
names_array
end

def num_points_scored(player_name)
return_value = nil
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |name, player_stats|
          if name == player_name
            player_stats.each do |category, value|
              if category == :points
                return_value = value
              end
            end
          end
        end
      end
    end
  end
return_value
end




def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
    binding.pry
      team_data.each do |attribute, data|
        #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
        binding.pry

        #what is 'data' at each loop through out .each block? when will the following line of code work and when will it break?
        data.each do |data_item|
            binding.pry
      end
    end
  end
end
