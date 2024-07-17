# lib/tasks/update_isrenting.rake
namespace :update_isrenting do
  desc "Update isRenting column daily"
  task run: :environment do
    today = Date.today

    # Update isRenting to 1 where start date is today
    Reserve.where(start: today).update_all(isRenting: 1)

    # Update isRenting to 3 where end date is before today and isRenting is 2
    Reserve.where('reserves.end < ?', today).where(isRenting: 2).update_all(isRenting: 3)

    # Update isRenting to 4 where end date is before today and isRenting is 1
    Reserve.where('reserves.end < ?', today).where(isRenting: 1).update_all(isRenting: 4)
  end
end
