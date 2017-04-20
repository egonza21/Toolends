class Lend < ApplicationRecord
  belongs_to :tool
  belongs_to :student

  def self.search(search)
    if search
      where("title LIKE ?", "%#{search}%")
    else
      all
    end
  end
end
