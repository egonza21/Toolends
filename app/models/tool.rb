class Tool < ApplicationRecord
  has_many :lends_tool

  validates :title, presence: true
<<<<<<< HEAD



##  def self.search(search)
  #  if search
  #    find(:all, :conditions => ['name LIKE ?', "%#{search}%"])
    #else
    #  find(:all)
  #  end
#  end





=======
>>>>>>> 88a514bdc8b65a563dc461b4230311655164e579
end
