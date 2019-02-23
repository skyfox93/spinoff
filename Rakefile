# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'
namespace :db do
desc "migrate avatars to cloud"
  task migrate_to_cloud: :environment do
    Photo.all.each do |photo|
      unless photo.old_file.file.nil?
        photo.update(remote_file_url: photo.old_file.file.file)
      end
      puts photo.id
    end
  end
end

Rails.application.load_tasks
