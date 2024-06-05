# clock.rb

require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.day, 'Update isRenting', at: '17:30') do
    Reserve.update_is_renting_for_all
  end
end
