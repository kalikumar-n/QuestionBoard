namespace :cleanup_inactive_users do
  desc 'Deleting the Users who are inactive for the past 6 months'
  require 'date'

  task start: :environment do
    puts 'User Data Cleanup Process Starts...'
    datetime = DateTime.now << 6
    inactive_users = User.active.invert_where
    inactive_users = inactive_users.where('status_updated_at <= ?', datetime)
    puts "Users to be removed #{inactive_users.count}"
    inactive_users.destroy_all
    puts 'Cleanup Process Ended...'
  end
end
