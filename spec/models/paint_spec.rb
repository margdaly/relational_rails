require 'rails_helper'

RSpec.describe Paint, type: :model do
  describe "relationships" do
     it { should belong_to :artist }
  end

  describe "instance methods" do
    describe 'high pressure true' do
      it 'selects paints that are high pressured' do
        charney = Artist.create!(name: 'Charney', sponsored: true, rank: 8)
        venice = charney.paints.create!(name: "Venice", brand: "Montana", high_pressure: false, opacity: 2)
        slate = charney.paints.create!(name: "Slate", brand: "Montana", high_pressure: true, opacity: 5)

        expect(Paint.high_pressure_true).to eq([slate])

        venice.high_pressure = true
        venice.save

        expect(Paint.high_pressure_true).to eq([slate, venice])
      end
    end
  end
end