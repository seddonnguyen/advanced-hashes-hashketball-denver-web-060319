require 'pry'
# Write your code here!
def game_hash
{
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
			"Bismack Biyombo" => {
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

def num_points_scored(name)
  point = ""
  game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :players
  			data.each do |player, stats|
  				if player == name
  					stats.each do |stat, data|
  						if stat == :points
  							point = data
  						end
  					end
  				end
  			end
  		end
  	end
  end
  point
end

def shoe_size(name)
  size = ""
  game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :players
  			data.each do |player, stats|
  				if player == name
  					stats.each do |stat, data|
  						if stat == :shoe
  							size = data
  						end
  					end
  				end
  			end
  		end
  	end
  end
  size
end

def team_colors(team_name)
	team = ""
  game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :team_name
  			team = data
  		end

  		if attribute == :colors && team == team_name
  			return data
  		end
  	end
  end
end

def team_names
	teams = []
	game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :team_name
  			teams << data
  		end
  	end
  end
  teams
end

def player_numbers(team_name)
	team = ""
  numbers = []
  game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :team_name
  			team = data
  		end

  		if attribute == :players && team == team_name
  			data.each do |player, stats|
  				stats.each do |stat, data|
  					if stat == :number
  						numbers << data
  					end
  				end
  			end
  		end
  	end
  end
  numbers
end

def player_stats(player_name)
  game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :players
  			data.each do |player, stats|
  				if player == player_name
  					return stats
  				end
  			end
  		end
  	end
  end
end

def big_shoe_rebounds
  size = -1
  rebound = -1
  player_name = ""
  game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :players
  			data.each do |player, stats|
  				stats.each do |stat, data|
  					if stat == :shoe && size < data
  						size = data
  						player_name = player
  					end
  				end
  			end
  		end
  	end
  end

  game_hash.each do |location, team_data|
  	team_data.each do |attribute, data|
  		if attribute == :players
  			data.each do |player, stats|
  				if player == player_name
  					stats.each do |stat, data|
  						if stat == :rebounds
  							rebound = data
  						end
  					end
  				end
  			end
  		end
  	end
  end
  rebound
end

def most_points_scored
	score = -1
	player_name = ""
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if score < stats[:points]
				score = stats[:points]
				player_name = player
			end
		end
	end
	player_name
end

def winning_team
	temp = 0
	score = -1
	team_name = ""
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			temp += stats[:points]
		end
		if score < temp
			team_name = team_data[:team_name]
			score = temp
		end
		temp = 0
	end
	team_name
end

def player_with_longest_name
	length = -1
	player_name = ""
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if length <= player.length
				length = player.length
				player_name = player
			end 
		end
	end
	player_name
end

def long_name_steals_a_ton?
	length = -1
	player_name = ""
	steals = -1
	most_steals = -1
	most_steals_player = ""
	game_hash.each do |location, team_data|
		team_data[:players].each do |player, stats|
			if most_steals < stats[:steals]
				most_steals = stats[:steals]
				most_steals_player = player
			end
			
			if length <= player.length
				length = player.length
				player_name = player
				steals = stats[:steals]
			end 
		end
	end
	player_name == most_steals_player
end

