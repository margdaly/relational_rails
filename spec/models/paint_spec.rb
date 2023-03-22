require 'rails_helper'

RSpec.describe Paint, type: :model do
  describe "relationships" do
     it { should belong_to :artist }
  end
end