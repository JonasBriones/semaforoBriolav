class Poll < ApplicationRecord
  belongs_to :state
  attr_accessor :rut

  validates :rut, rut: true
end
