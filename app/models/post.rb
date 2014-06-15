class Post < ActiveRecord::Base
  belongs_to :user
  validates :body, length: { maximum: 200 }, presence: true
  # validate :some_validate_method
end
