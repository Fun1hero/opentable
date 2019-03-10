class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :table
  has_one :restaurant, :through => :table

  validates_presence_of :customer
  validates_presence_of :table
  validates_presence_of :starts_at
  validates_presence_of :ends_at

  validate :availability

  def availability
    errors.add(:base, "restaurant closed") unless restaurant.open?(starts_at, ends_at)
    errors.add(:base, "no tables avaialble") unless restaurant.available_tables(starts_at, ends_at).any?
  end
end
