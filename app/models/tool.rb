class Tool < ApplicationRecord
  has_many :lend


  validates :title, presence: true




end
