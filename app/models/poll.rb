class Poll < ApplicationRecord
  belongs_to :state
  belongs_to :user
  has_many  :feedbacks

end
