FactoryGirl.define do
  factory :supplement do
    file Rack::Test::UploadedFile.new(File.open(File.join(Rails.root, '/spec/test.pdf')))
  end

end
