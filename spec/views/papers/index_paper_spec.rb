require 'rails_helper'

describe "papers/index", type: :view do
  before(:each) do
    assign(:papers, [
      Paper.create!(
        title: "COMPUTING MACHINERY AND INTELLIGENCE",
        venue: "Mind 49: 433-460",
        year: 1950
      ),
      Paper.create!(
        title: "COMPUTING MACHINERY AND INTELLIGENCE",
        venue: "Mind 49: 433-460",
        year: 1950
      )
    ])
  end

  it "renders a list of papers" do
    render
    cell_selector = 'tr>td'
    assert_select cell_selector, text: Regexp.new("COMPUTING MACHINERY AND INTELLIGENCE".to_s), count: 2
    assert_select cell_selector, text: Regexp.new("Mind 49: 433-460".to_s), count: 2
    assert_select cell_selector, text: Regexp.new(1950.to_s), count: 2
  end

  it "should have a link to delete a paper" do
    render

    expect(page).to have_text("COMPUTING MACHINERY AND INTELLIGENCE")
    expect(page).to have_text("Mind 49: 433-460")
    expect(page).to have_text("1950")
    expect(page).to have_link 'Delete', href: paper_path(@itBook)
  end
end
