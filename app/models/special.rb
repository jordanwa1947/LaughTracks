class Special < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :comedian

  def self.average_runtime
    average(:runtime).round(2)
  end
end
