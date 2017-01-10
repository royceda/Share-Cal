class Event < ApplicationRecord

  validates :name, presence: true
  validates :begin, presence: true
  validates :end, presence: true

end
