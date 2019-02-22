# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'

Rails.application.load_tasks

namespace :db do
  desc "migrate images to cloud"
  task :migrate_to_cloud do
    User.all.each do |user|
      upload_resp=Cloudinary::Uploader.upload(user.avatar.file.file)
      user.update(remote_avatar_url: upload_resp['secure_url'])
      puts user.id
    end
  end
end
