describe "Index Author Page" do
  it "should show all saved Authors" do
    visit index_author_path

    expect(page).to have_text("Name")
    expect(page).to have_text("Homepage")
    expect(page).to have_link 'New', href: new_author_path
  end
end