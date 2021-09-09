class Fan
          attr_accessor :name

          def initialize(name)
            self.name = name
          end

          def favorite_players
            FanPlayer.all.select do |fan_player|
              fan_player.fan == self
            end.map do |fan_player|
              fan_player.player
            end
          end

        end

        class FanPlayer
          attr_accessor :fan, :player

          @@all = []

          def initialize(fan, player)
            self.fan = fan
            self.player = player
            save
          end

          def save
            @@all << self
          end

          def self.all
            @@all
          end
        end
