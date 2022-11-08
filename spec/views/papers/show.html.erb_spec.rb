require 'rails_helper'

RSpec.describe "papers/show", type: :view do
  before(:each) do
    assign(:paper, Paper.create!(
      title: "Title",
      venue: "Venue",
      year: 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Venue/)
    expect(rendered).to match(/2/)
  end
end

describe "My Paper Show Page", type: :feature do
  it "should render without error" do
    paper = FactoryBot.create :paper
    visit paper_path(paper)
  end

  it "should show the authors full name given an author" do
    alan = FactoryBot.create :author
    paper = Paper.create(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950, authors: [alan])
    visit paper_path(paper)
    expect(page).to have_text(alan.name)
  end
end
