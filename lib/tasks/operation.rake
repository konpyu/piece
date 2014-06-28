namespace :operation do
  desc 'aggregate posts number'
  task :calc_number => :environment do
    ActiveRecord::Base.transaction do
      all_user_id = Post.all.pluck(:user_id).uniq
      all_user_id.each do |uid|
        posts = Post.where(user_id: uid).order(created_at: :asc)
        number = 1
        posts.each do |post|
          post.number = number
          post.save!
          number += 1
        end
      end
    end
  end
end
