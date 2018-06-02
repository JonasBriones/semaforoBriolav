class Poll < ApplicationRecord
  belongs_to :state
  has_many  :feedbacks
end
