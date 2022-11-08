require 'rails_helper'

describe "papers/index", type: :view do
  before(:each) do
    assign(:papers, [
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      ),
      Paper.create!(
        title: "Title",
        venue: "Venue",
        year: 2
      )
    ])
  end

  it "renders a list of papers" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("Title".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Venue".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(2.to_s), count: 2
  end
end

describe "myOwn PaperIndex Tests", type: :feature do
  it "should have a link to delete a paper" do
    @itBook = FactoryBot.create :paper
    visit papers_path

    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
    expect(page).to have_link 'Delete', href: paper_path(@itBook)
  end

  it"should show papers according to filter" do
    paper1 = FactoryBot.create :paper
    paper2 = FactoryBot.create :paper
    paper2.update(year: 1951)
    visit papers_path(year: 1950)
    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
    expect(page).not_to have_text("1951")

  end
end
