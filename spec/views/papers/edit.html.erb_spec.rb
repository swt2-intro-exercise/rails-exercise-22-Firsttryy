require 'rails_helper'

RSpec.describe "papers/edit", type: :view do
  let(:paper) {
    Paper.create!(
      title: "MyString",
      venue: "MyString",
      year: 1
    )
  }

  before(:each) do
    assign(:paper, paper)
  end

  it "renders the edit paper form" do
    render

    assert_select "form[action=?][method=?]", paper_path(paper), "post" do

      assert_select "input[name=?]", "paper[title]"

      assert_select "input[name=?]", "paper[venue]"

      assert_select "input[name=?]", "paper[year]"
    end
  end
end

describe "My Paper Edit Page", type: :feature do
  it "should render without error" do
    paper = FactoryBot.create :paper
    visit edit_paper_path(paper)
  end

  it "should save changes" do
    paper = FactoryBot.create :paper
    visit edit_paper_path(paper)
    fill_in 'paper_title', with: 'COMPUTING MACHINERY AND INTELLIGENCE'
    fill_in 'paper_venue', with: 'Mind 49: 433-460'
    fill_in 'paper_year', with: 1950
    find('input[type="submit"]').click
  end

  it "should have a multiple select box for authors" do
    paper = FactoryBot.create :paper
    visit edit_paper_path(paper)
    expect(page).to have_select('paper_author_ids', multiple: true)
    expect(page).to have_css('select[multiple]')
  end
end
