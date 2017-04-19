class Student < ApplicationRecord
  has_many :lend
  validates :name, presence: true

end
