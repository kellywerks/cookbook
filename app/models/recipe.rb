class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :tags
  has_many :ratings

  validates :name, :presence => true, :uniqueness => true

  def average_rating
    self.ratings.sum(&:rating).to_f/self.ratings.length.to_f
  end
end
