class Player

        attr_reader :rebounds, :points, :number, :shoe,
                    :assists, :steals, :slam_dunks

        attr_accessor :name, :blocks, :team

        @@all = []

        def initialize(player_hash)
          player_hash.each do |key, value|
           send("#{key}=", value) if methods.include?("#{key}=".to_sym)
          end
          save
        end

        def save
          @@all << self
        end

        def introduce
          puts "Hi, I'm #{self.name}."
        end

        def self.all
          @@all
        end

        def self.find_by_name(name)
          all.find do |player|
            player.name == name
          end
        end

        def self.create_players(player_hashes)
          player_hashes.map do |player_hash|
            new(player_hash)
          end
        end

        def fans
          FanPlayer.all.select do |fan_player|
              fan_player.player == self
            end.map do |fan_player|
              fan_player.fan
            end
        end

        private

        attr_writer :rebounds, :points, :number, :shoe,
                    :assists, :steals, :slam_dunks

      end
