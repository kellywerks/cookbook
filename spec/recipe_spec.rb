require 'spec_helper'

describe Recipe do
  it 'should create just fine' do
    recipe1 = Recipe.create(:name => "Lucinda")
    tag1 = recipe1.tags.create(:name => "raisins")
    recipe1.tags.should eq [tag1]
  end

  it 'should not allow you to save without a name' do
    recipe1 = Recipe.new()
    recipe1.save.should eq false
  end

  it { should have_and_belong_to_many(:tags) }
  it { should validate_presence_of(:name) }
end
