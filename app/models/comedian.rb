class Comedian < ActiveRecord::Base
  validates_presence_of :age, :name

  has_many :specials

  def self.average_age
    average(:age).round(2)
  end

  def self.uniq_cities
    distinct.pluck(:city)
  end
end
