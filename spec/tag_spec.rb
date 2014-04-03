require 'spec_helper'

describe Tag do
  it 'should create just fine' do
    tag1 = Tag.create(:name => "pumpkins")
    recipe1 = tag1.recipes.create(:name => "Pickled Pumpkins")
    tag1.recipes.should eq [recipe1]
  end

  it 'should not allow you to save without a name' do
    tag1 = Tag.new()
    tag1.save.should eq false
  end

  it { should validate_presence_of(:name) }
  it { should have_and_belong_to_many(:recipes) }

end
