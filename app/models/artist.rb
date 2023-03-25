class Artist < ApplicationRecord
  has_many :paints

  def self.order_by_most_recently_created
    order(created_at: :desc)
  end

  def paint_count
    self.paints.count
  end
end