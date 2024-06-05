# clock.rb

require 'clockwork'
require './config/boot'
require './config/environment'

module Clockwork
  handler do |job|
    puts "Running #{job}"
  end

  every(1.day, 'Update isRenting', at: '00:00') do #毎日0時にreserveを実行関数を実行（isRentingの値をアップデート）
    Reserve.update_is_renting_for_all
  end
end
