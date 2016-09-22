require_relative 'die'
require_relative 'project'

module FundingRound
  def self.take_turn(project)
    die = Die.new
    if die.roll.even?
      project.add_fund
    else
      project.remove_fund
    end

    # pledge = PledgePool.random
    # project.received_pledge(pledge)
    project.received_pledge(PledgePool.random)
  end
end