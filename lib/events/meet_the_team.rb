module Events
  class MeetTheTeam < Base
    process do
      ask 'First, I forgot, what\'s your name ?'
    end
  end
end
  