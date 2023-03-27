class Paint < ApplicationRecord
  belongs_to :artist

  def self.high_pressure_true
    where(high_pressure: true).to_a
  end
end
