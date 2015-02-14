require 'rails_helper'

describe Project do

  it { should have_many(:tasks) }
  it { should belong_to(:user) }
  it { should validate_presence_of(:title) }
  it { should ensure_length_of(:title).is_at_most(50) }

end
