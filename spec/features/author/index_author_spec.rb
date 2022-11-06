require 'rails_helper'

describe "Index Author Page", type: :feature do
  it "should show all saved Authors" do
    visit authors_path

    expect(page).to have_text("Name")
    expect(page).to have_text("Homepage")
    expect(page).to have_link 'New', href: new_author_path
  end
end