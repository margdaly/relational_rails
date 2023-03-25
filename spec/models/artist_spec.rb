require 'rails_helper'

RSpec.describe Artist do
  it { should have_many :paints }

  describe '#instance_methods' do
    let!(:coyote) { Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9) }
    let!(:mars) { Artist.create!(name: 'Farris Mars', sponsored: true, rank: 8) }
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 7) }
    let!(:toffee) { graves.paints.create!(name: 'Toffee', 
                                          brand: 'Montana', 
                                          high_pressure: false, 
                                          opacity: 3) }
    let!(:latte) { graves.paints.create!(name: 'Latte', 
                                         brand: 'Montana', 
                                         high_pressure: false, 
                                         opacity: 4) }
    let!(:hazelnut) { graves.paints.create!(name: 'Hazelnut', 
                                            brand: 'Molotow', 
                                            high_pressure: true, 
                                            opacity: 5) }
    
    describe '#order_by_most_recently_created' do
      it 'orders paints by most recently created' do
        expect(graves.paints.last).to eq(hazelnut)
      end
    end

    describe '#paint_count' do
      it 'counts the number of paints' do
        expect(graves.paint_count).to eq(3)
      end
    end
  end
end