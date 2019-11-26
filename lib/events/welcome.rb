module Events
  class Welcome < Base
    process do
      say 'Ok... We are about to begin.'
      ask 'Ready to go ?'
    end
  end
end
