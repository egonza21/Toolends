class Tool < ApplicationRecord
  has_many :lends_tool

  validates :title, presence: true
end
