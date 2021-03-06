require 'crowdfund/spec_helper'
require 'crowdfund/fundrequest'
require 'crowdfund/project'
require 'crowdfund/die'

module CrowdFund
  describe FundRequest do

    before do
      @fundrequest = FundRequest.new("VC-Friendly Start-up Projects")

      @initial_funding = 100
      @project = Project.new("Project XYZ", 1000, @initial_funding)

      @fundrequest.add_project(@project)

      $stdout = StringIO.new
    end

    it "add funds to the project if an even number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(4)
      allow(PledgePool).to receive(:random).and_return(Pledge.new(:silver, 75))

      @fundrequest.request_funding(3)

      expect(@project.funding).to eq(@initial_funding + (3 * (25 + 75)))
    end

    it "remove funds from the project if an odd number is rolled" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      allow(PledgePool).to receive(:random).and_return(Pledge.new(:gold, 100))

      @fundrequest.request_funding(3)

      expect(@project.funding).to eq(@initial_funding + (3 * (100 - 15)))
    end

  end
end
