
describe "Author", :type => :model do

  author = Author.new()
  expect(author.first_name).to eq("Alan")
end