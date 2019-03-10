class Table < ApplicationRecord
  belongs_to :restaurant
  has_many :reservations

  def available?(starts_at, ends_at)
    !reservations.order(:starts_at).pluck(:starts_at, :ends_at).select do |r|
      (r[0] <= starts_at && starts_at <= r[1]) ||
      (r[0] <= ends_at && ends_at <= r[1])
    end.any?
  end
end
