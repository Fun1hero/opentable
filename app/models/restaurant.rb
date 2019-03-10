class Restaurant < ApplicationRecord
  has_many :tables
  has_many :reservations, :through => :tables

  def time_number(time)
    time.strftime("%k%M").to_i
  end

  def open?(reservation_starts_at, reservation_ends_at)
    time_number(opens_at) <= time_number(reservation_starts_at) &&
    time_number(reservation_ends_at) <= time_number(closes_at)
  end

  def available_tables(starts_at, ends_at)
    tables.select do |t|
      t.available?(starts_at, ends_at)
    end
  end
end
