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

    pledge = PledgePool.random
    puts "#{project.name} received a #{pledge.name} pledge worth $#{pledge.amount}."
  end
end