class User < ApplicationRecord
  has_many :polls
  accepts_nested_attributes_for :polls
  validates :rut, presence: true
end
