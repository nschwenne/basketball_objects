 class Team
        attr_accessor :name, :colors

        @@all = []

        def initialize(team_hash)
          team_hash.each do |key, value|
           send("#{key}=", value) if methods.include?("#{key}=".to_sym)
          end
          save
        end

        def save
          @@all << self
        end

        def self.create_teams(team_hashes)
          team_hashes.each do |team_hash|
            new(team_hash)
          end
        end

        def self.all
          @@all
        end

        def add_player(player)
          player.team = self
        end

        def players
          Player.all.select do |player|
            player.team == self
          end
        end
      end
