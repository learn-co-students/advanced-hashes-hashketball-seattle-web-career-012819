require "pry"

def game_hash
  game_hash = {
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

#iterate into the first set of data. After that, you want to iterate into the players stats. If the passed in data (argument) is equal to the key(player) then you can return the number of points by going into the nested hash. 

 def num_points_scored(name)
  game_hash.each do |team, attributes|
     game_hash[team][:players].each do |player, stats|
       if name == player 
         return game_hash[team][:players][name][:points]
      end
    end
  end
end       
## Or you could set it up the same way, except begin with a variable of points and set it to nil, then instead of returning, you could set that points value equal to the game_hash output and return the points just before closing out the method
      
  
   
def shoe_size(name)
  game_hash.each do |team, attributes|
       if game_hash[team][:players][name]
         return game_hash[team][:players][name][:shoe]
       end
  end
 end

## Completed this morning. Final color_array ended up being an array within an array so I had to flatten. Could have also used the other solution below this one and not pushed into array, simply just returned the array

def team_colors(team_name)
  
  game_hash.each do |team, attributes|
    attributes.each do |key, value|
      if value == team_name 
        return game_hash[team][:colors]
      
      end
    end
  end
  
end 

#def team_colors(name)
 # game_hash.each do |team, attributes|
   # if game_hash[team][:team_name] == name
    #  return game_hash[team][:colors]
  # end
  #end
#end

def team_names
  array = [] 
  game_hash.each do |team, attributes|
    attributes.each do |key, value|
      if key == :team_name
        array.push(value)
        
      end
    end
  end
  array
end

def player_numbers(team_name)
team_number = []
game_hash.each do |team, attributes|
     game_hash[team].each do |things, value| 
       if team_name == value
         game_hash[team][:players].each do |name, category|
          category.each do |stat, digits|
            if stat == :number 
              team_number << digits
              
            end
          end   
        end
      end
    end
  end
  team_number
end
 # Created a hash to push all of the stats into. Iterate through the first data set in order to get into the attributes of the team. We want to get into a particular value of team, specifically the players name. The players name is accessed by doing an iteration of team_data (the value) and finding the nested key, which is done by simply calling :players. If that key is equal to the name(argument) that is passed through the method, then it will return the desired stats. Since I had already created an empty hash, I made the output equal to the empty hash and returned the hash.
def player_stats(name)
  stats = {}
  game_hash.each do |team, team_data|
    team_data[:players].each do |data, output|
      if data == name 
        stats = output
      end
    end
  end
  stats
end
   
   
def big_shoe_rebounds 
  rebounds = 0
  shoe_size = 0
  game_hash.each do |team, data|
    data[:players].each do |name, stat| 
      if stat[:shoe] > shoe_size 
        shoe_size = stat[:shoe]
        rebounds = stat[:rebounds]
      end
    end
  end
  return rebounds
end

  
      
  


