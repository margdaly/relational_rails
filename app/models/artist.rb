class Artist < ApplicationRecord
  has_many :paints, dependent: :delete_all

  validates_presence_of :name

  def self.order_by_most_recently_created
    order(created_at: :desc)
  end

  def paint_count
    self.paints.count
  end

  def order_by_name(sort) 
    if sort == 'abc'
      self.paints.order(name: :asc)
    else
      self.paints
    end
  end
end