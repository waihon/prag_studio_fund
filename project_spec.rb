require_relative 'spec_helper'
require_relative 'project'

describe Project do
  before do
    @target_funding = 1000    
    @initial_funding = 100
    @project = Project.new("Project XYZ", @target_funding, @initial_funding)
    $stdout = StringIO.new
  end

  it "has an initial target funding amount" do
    expect(@project.target_funding).to eq(@target_funding)
  end

  it "computes the total funding outstanding as the target funding amount minus the funding amount" do
    expect(@project.funding_needed).to eq(@target_funding - @initial_funding)
  end

  it "increases funds by 25 when funds are added" do
    @project.add_fund

    expect(@project.funding).to eq(@initial_funding + 25)
  end

  it "decreases funds by 15 when funds are removed" do
    @project.remove_fund

    expect(@project.funding).to eq(@initial_funding - 15)
  end

  context "with a default funding" do
    before do
      @target_funding = 1000
      @project = Project.new("Project XYZ", @target_funding)
    end

    it "has a default value of 0 for funding amount" do
      expect(@project.funding).to eq(0)
    end
  end

  context "with sufficient funding" do
    before do
      @target_funding = 1000
      @initial_funding = 100
      @project = Project.new("Project XYZ", @target_funding, @initial_funding)
    end

    it "is fully funded" do
      @project.add_fund(@target_funding - @initial_funding)

      expect(@project).to be_fully_funded
    end
  end

  context "with insufficient funding" do
    before do
      @target_funding = 1000
      @initial_funding = 100
      @project = Project.new("Project XYZ", @target_funding, @initial_funding)
    end

    it "is not fully funded" do
      @project.add_fund(@target_funding - @initial_funding - 1)

      expect(@project).not_to be_fully_funded
    end
  end
end