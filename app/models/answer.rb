class Answer < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  validates :body, length: { minimum: 50 }, null:false
end
