require_relative 'matching_project'

describe MatchingProject do

  before do
    @target_funding = 1000
    @initial_funding = 100
    @project = MatchingProject.new("Matching Project", @target_funding, @initial_funding)
  end

  it "does not receive matching funds before getting half of its funding secured" do
    @project.add_fund(@project.half_funding - @initial_funding - 1) 

    expect(@project.secured_half_funding?).to be_falsey
  end

  it "receives matching funds after getting half of its funding secured" do
    @project.add_fund(@project.half_funding - @initial_funding)

    expect(@project.secured_half_funding?).to be_truthy
  end

end