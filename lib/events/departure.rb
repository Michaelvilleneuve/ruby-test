module Events
  class Departure < Base
    process do
      countdown
    end

    def countdown
      3.downto(1) do |remaining_seconds|
        say "#{remaining_seconds}...."
        sleep 1
      end
      say 'GOO !!!'
    end
  end
end
