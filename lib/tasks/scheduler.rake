desc "This task is called by the Heroku scheduler add-on"

task :create_user_statuses => :environment do
  puts "Creating new status for all users..."
  User.create_status_for_all_users
  puts "done."
end