require 'rails_helper'

describe "Edit author page", type: :feature do
  it "should exist at 'edit_author_path' and render withour error" do
    @alan = FactoryBot.create :author
    visit edit_author_path(@alan)
  end

  #todo use @alan.reload

end