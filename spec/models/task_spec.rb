require 'rails_helper'

describe Task do

  it { should have_many(:comments) }
  it { should belong_to(:project) }
  it { should validate_presence_of(:title) }
  it { should validate_presence_of(:deadline) }


end
