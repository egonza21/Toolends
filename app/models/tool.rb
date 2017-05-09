class Tool < ApplicationRecord
  has_many :lends_tool


  validates :title, presence: true



##  def self.search(search)
  #  if search
  #    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    #else
    #  find(:all)
  #  end
#  end





end
