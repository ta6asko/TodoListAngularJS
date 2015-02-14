require 'rails_helper'

describe Comment do
  it { should have_many(:supplements) }
  it { should belong_to(:task) }
  it { should validate_presence_of(:text) }
end
