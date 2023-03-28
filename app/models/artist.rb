class Artist < ApplicationRecord
  has_many :paints, dependent: :delete_all

  validates_presence_of :name

  def self.order_by_most_recently_created
    order(created_at: :desc)
  end

  def paint_count
    self.paints.count
  end

 # * needs to be refactored with helper methods and moved?
  def order_by(sort) 
    if sort == 'abc'
      paints.order(name: :asc)
    elsif sort.present? 
      paints.where('opacity >= ?', sort)
    else
      paints
    end
  end
end