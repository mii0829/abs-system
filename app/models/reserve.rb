class Reserve < ApplicationRecord
    def self.update_is_renting_for_all
      reserves = Reserve.all
      reserves.each do |reserve|
        if reserve.end < Date.today
          reserve.update(isRenting: 4)
        elsif reserve.start == Date.today
          reserve.update(isRenting: 1)
        end
      end
    end
  end
  