class Question < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :body, length: { minimum: 5 }
end
