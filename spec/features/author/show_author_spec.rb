describe "Show Author Page" do
  it "should show the Authors properties" do
    @alan = FactoryBot.create :author

    visit author_path(@alan)

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("Homepage")
  end
end