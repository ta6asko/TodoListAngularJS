require 'rails_helper'

describe Supplement do
  it { should belong_to(:comment) }
end
