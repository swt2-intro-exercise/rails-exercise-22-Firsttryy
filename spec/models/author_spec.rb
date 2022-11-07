describe "Author Model", :type => :model do

  it "should create a new Author and be able to read its first name" do
    author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
    expect(author.first_name).to eq("Alan")
  end

  it "should not pass validation with empty last name" do
    author = Author.new(first_name: "Alan", last_name: "", homepage: "http://wikipedia.org/Alan_Turing")
    expect(author).to_not be_valid
  end
end