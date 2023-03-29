require 'rails_helper'

RSpec.describe Artist do
  describe 'relationships' do
    it { should have_many(:paints ).dependent(:delete_all) }
  end

  describe "validations" do
    it { should validate_presence_of :name }
  end

  describe '#class_methods' do
    let!(:coyote) { Artist.create!(name: 'Criminal Coyote', sponsored: false, rank: 9, created_at: 'Sun, 26 Mar 2023 03:28:02 UTC +00:00') }
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8, created_at: 'Sat, 25 Mar 2023 03:28:02 UTC +00:00') }
    let!(:mars) { Artist.create!(name: 'Farris Mars', sponsored: true, rank: 9, created_at: 'Fri, 24 Mar 2023 03:28:02 UTC +00:00') }
    
    describe '#order_by_most_recently_created' do
      it 'sorts Artists with most recently created first' do
        expect(Artist.order_by_most_recently_created).to eq([coyote, graves, mars])

        graves.created_at = 'Mon, 27 Mar 2023 03:28:02 UTC +00:00'
        graves.save

        expect(Artist.order_by_most_recently_created).to eq([graves, coyote, mars])
      end
    end
  end
  
  describe '#instance_methods' do
    let!(:graves) { Artist.create!(name: 'Mike Graves', sponsored: true, rank: 8, created_at: 'Sat, 25 Mar 2023 03:28:02 UTC +00:00') }
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

    describe '#paint_count' do
      it 'counts the number of paints' do
        expect(graves.paint_count).to eq(3)
      end
    end

    describe '#order_by' do
      it "sorts artist's paints by name alphabetically" do
        expect(graves.paints).to eq([toffee, latte, hazelnut])
        expect(graves.order_by('abc')).to eq([hazelnut, latte, toffee])
      end

      it "selects artist's paints that are a certain opacity or higher" do
        expect(graves.order_by(4)).to eq([latte, hazelnut])
      end
    end
  end
end