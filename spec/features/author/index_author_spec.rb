require 'rails_helper'

describe "Index Author Page", type: :feature do

  it "should show all saved Authors" do
    visit authors_path

    expect(page).to have_text("Name")
    expect(page).to have_text("Homepage")
    expect(page).to have_link 'New', href: new_author_path
  end

  it "should have a link to the edit page" do
    @alan = FactoryBot.create :author
    visit authors_path

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
    expect(page).to have_link 'Edit', href: edit_author_path(@alan)
  end

  it "should have a link to delete an author" do
    @alan = FactoryBot.create :author
    visit authors_path

    expect(page).to have_text("Alan Turing")
    expect(page).to have_text("http://wikipedia.de/Alan_Turing")
    expect(page).to have_link 'Delete', href: author_path(@alan), turbo_method: :delete, turbo_confirm: "Are you sure?"
  end

end