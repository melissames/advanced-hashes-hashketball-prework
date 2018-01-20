def game_hash
  game_hash = {
    :home => {
      :team_name => 'Brooklyn Nets',
      :colors => ['Black', 'White'],
      :players => {
        'Alan Anderson' => {
          :number => '0',
          :shoe => '16',
          :points => '22',
          :rebounds => '12',
          :assists => '12',
          :steals => '3',
          :blocks => '1',
          :slam_dunks => '1'
        },
        'Reggie Evans' => {
          :number => '30',
          :shoe => '14',
          :points => '12',
          :rebounds => '12',
          :assists => '12',
          :steals => '12',
          :blocks => '12',
          :slam_dunks => '7',
        },
        'Brook Lopez' => {
          :number => '11',
          :shoe => '17',
          :points => '17',
          :rebounds => '19',
          :assists => '10',
          :steals => '3',
          :blocks => '1',
          :slam_dunks => '15',
        },
        'Mason Plumlee' => {
          :number => '1',
          :shoe => '19',
          :points => '26',
          :rebounds => '12',
          :assists => '6',
          :steals => '3',
          :blocks => '8',
          :slam_dunks => '5',
        },
        'Jason Terry' => {
          :number => '31',
          :shoe => '15',
          :points => '19',
          :rebounds => '2',
          :assists => '2',
          :steals => '4',
          :blocks => '11',
          :slam_dunks => '1',
        }
      }
    },
    :away => {
      :team_name => 'Charlotte Hornets',
      :colors => ['Turquoise', 'Purple'],
      :players => {
        'Jeff Adrien' => {
          :number => '4',
          :shoe => '18',
          :points => '10',
          :rebounds => '1',
          :assists => '1',
          :steals => '2',
          :blocks => '7',
          :slam_dunks => '2'
        },
        'Bismak Biyombo' => {
          :number => '0',
          :shoe => '16',
          :points => '12',
          :rebounds => '4',
          :assists => '7',
          :steals => '7',
          :blocks => '15',
          :slam_dunks => '10'
        },
        'DeSagna Diop' => {
          :number => '2',
          :shoe => '14',
          :points => '24',
          :rebounds => '12',
          :assists => '12',
          :steals => '4',
          :blocks => '5',
          :slam_dunks => '5'
        },
        'Ben Gordon' => {
          :number => '8',
          :shoe => '15',
          :points => '33',
          :rebounds => '3',
          :assists => '2',
          :steals => '1',
          :blocks => '1',
          :slam_dunks => '0'
        },
        'Brendan Haywood' => {
          :number => '33',
          :shoe => '15',
          :points => '6',
          :rebounds => '12',
          :assists => '12',
          :steals => '22',
          :blocks => '5',
          :slam_dunks => '12'
        }
      }
    }
  }
end

def num_points_scored (player_name)

  game_hash.collect { |home_or_away, name_color_player_object|
    name_color_player_object.collect { |name_color_player, name_color_player_data|
      if name_color_player_data.class == Hash
        name_color_player_data.collect { |player, stats|
          if player == player_name
            stats.collect { |stat_name, stat_number|
              if stat_name == :points
                return stat_number.to_i
              end
            }
          end
        }
      end
    }
  }
end

def shoe_size (player_name)

  game_hash.collect { |home_or_away, name_color_player_object|
    name_color_player_object.collect { |name_color_player, name_color_player_data|
      if name_color_player_data.class == Hash
        name_color_player_data.collect { |player, stats|
          if player == player_name
            stats.collect { |stat_name, stat_number|
              if stat_name == :shoe
                return stat_number.to_i
              end
            }
          end
        }
      end
    }
  }
end

def team_colors (teams)
  game_hash.collect { |home_or_away, name_color_player_object|
    name_color_player_object.collect { |name_color_player, name_color_player_data|
      if name_color_player_data == teams
        game_hash[home_or_away].collect { |name_color_player2, name_color_player_data2|
          if name_color_player2 == :colors
            return name_color_player_data2
          end
        }
      end
    }
  }
end

def team_names
  team_names_array = []

  game_hash.collect { |home_or_away, name_color_player_object|
    name_color_player_object.collect { |name_color_player, name_color_player_data|
        if name_color_player == :team_name
          team_names_array << name_color_player_data
        end
    }
  }
  team_names_array
end

def player_numbers (team_name)
  team_numbers_array = []

    game_hash.collect { |home_or_away, name_color_player_object|
    name_color_player_object.collect { |name_color_player, name_color_player_data|
      if name_color_player_data == team_name
        game_hash[home_or_away].collect { |name_color_player2, name_color_player_data2|
          if name_color_player_data2.class == Hash
            name_color_player_data2.collect { |players, stat_object|
              stat_object.collect { |stat_name, stat_number|
                if stat_name == :number
                  team_numbers_array << stat_number.to_i
                end
              }
            }
          end
        }
      end
    }
  }
  team_numbers_array
end

def player_stats (player_name)
  player_stats_object = {}

    game_hash.collect { |home_or_away, name_color_player_object|
    name_color_player_object.collect { |name_color_player, name_color_player_data|
      if name_color_player_data.class == Hash
        name_color_player_data.collect { |player, stats_object|
          if player == player_name
            stats_object.collect { |stat_name, stat_number|
              player_stats_object[stat_name] = stat_number.to_i
            }
          end
        }
      end
    }
  }
  player_stats_object
end

def big_shoe_rebounds
  largest_shoe_size = 0
  largest_shoe_player = nil

    game_hash.collect { |home_or_away, name_color_player_object|
    name_color_player_object.collect { |name_color_player, name_color_player_data|
      if name_color_player_data.class == Hash
        name_color_player_data.collect { |player, stats_object|
          stats_object.collect { |stats_name, stats_number|
            if stats_name == :shoe && stats_number.to_i > largest_shoe_size
              largest_shoe_size = stats_number.to_i
              largest_shoe_player = player
            end
          }
        }
        name_color_player_data.collect{ |player2, stats_object2|
          if player2 == largest_shoe_player
            stats_object2.collect { |stats_name2, stats_number2|
              if stats_name2 == :rebounds
                return stats_number2.to_i
              end
            }
          end
        }
      end
    }
  }
end
