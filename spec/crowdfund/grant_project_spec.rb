require 'crowdfund/grant_project'

module CrowdFund
  describe GrantProject do

    before do
      @target_funding = 1000
      @initial_funding = 100
      @project = GrantProject.new("Grant Project", @target_funding, @initial_funding)
    end

    it "does not allow funds to be removed" do
      @project.add_fund(150)

      expect(@project.funding).to eq(@initial_funding + 150)

      @project.remove_fund(75)

      expect(@project.funding).to eq(@initial_funding + 150)
    end
  end
end
