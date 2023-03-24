class Artist < ApplicationRecord
  has_many :paints

  def self.most_recently_created
    order(created_at: :desc)
  end
end