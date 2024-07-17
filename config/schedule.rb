# config/schedule.rb
set :output, "log/cron_log.log"

every 1.day, at: '07:00 am' do
  rake "update_isrenting:run"
end
