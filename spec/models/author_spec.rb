describe "Author", :type => :model do

  it "should work" do
    author = Author.new(first_name: "Alan", last_name: "Turing", homepage: "http://wikipedia.org/Alan_Turing")
    expect(author.first_name).to eq("Alan")
  end
end