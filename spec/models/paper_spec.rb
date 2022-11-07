require 'rails_helper'

describe "Paper Index Page", type: :model do
  it "should create a new Paper and be able to read its " do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
  end

  it "should not pass validation with empty title" do
    paper = Paper.new(title: "", venue: "Mind 49: 433-460", year: 1950)
    expect(paper).to_not be_valid
  end
end
