class Artist < ApplicationRecord
  has_many :paints

  def self.order_by_most_recently_created
    order(created_at: :desc)
  end

  def paint_count
    # require 'pry'; binding.pry
    self.paints.count
  end
end