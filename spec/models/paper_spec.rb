require 'rails_helper'

describe "Paper Model", type: :model do
  it "should create a new Paper and be able to read its title " do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(paper.title).to eq("COMPUTING MACHINERY AND INTELLIGENCE")
  end

  it "should not pass validation with empty title" do
    paper = Paper.new(title: "", venue: "Mind 49: 433-460", year: 1950)
    expect(paper).to_not be_valid
  end

  it "should not pass validation with empty venue" do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "", year: 1950)
    expect(paper).to_not be_valid
    end

  it "should not pass validation with empty year" do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: "")
    expect(paper).to_not be_valid
  end

  it "should not pass validation with year as string" do
    paper = Paper.new(title: "", venue: "Mind 49: 433-460", year: "1950")
    expect(paper).to_not be_valid
  end

  it"should relate to authors" do
    paper = Paper.new(title: "COMPUTING MACHINERY AND INTELLIGENCE", venue: "Mind 49: 433-460", year: 1950)
    expect(paper.authors).to eq([])
  end
end
