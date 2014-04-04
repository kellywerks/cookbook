require 'spec_helper'

describe Rating do
  it { should belong_to :recipe}
  it { should validate_presence_of :rating}
end
