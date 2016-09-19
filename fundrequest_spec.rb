require_relative 'spec_helper'
require_relative 'fundrequest'
require_relative 'project'
require_relative 'die'

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

    @fundrequest.request_funding(3)

    expect(@project.funding).to eq(@initial_funding + (3 * 25))
  end

  it "remove funds from the project if an odd number is rolled" do
    allow_any_instance_of(Die).to receive(:roll).and_return(3)

    @fundrequest.request_funding(3)

    expect(@project.funding).to eq(@initial_funding - (3 * 15))
  end

end
