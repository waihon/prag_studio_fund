require_relative 'fundable'

module CrowdFund
  class Project
    include Fundable

    attr_accessor :name
    attr_accessor :funding
    attr_reader :target_funding

    def initialize(name, target_funding, funding=0)
      @name = name
      @target_funding = target_funding
      @funding = funding
      @pledges_received = Hash.new(0)
    end

    def to_s
      "#{@name} has $#{@funding} in funding towards a goal of $#{@target_funding}, i.e. $#{funding_needed} is still needed."
    end

    def <=>(other)
      other.funding_needed <=> funding_needed
    end

    def received_pledge(pledge)
      @pledges_received[pledge.name] += pledge.amount
      @funding += pledge.amount
      puts "#{@name} received a #{pledge.name} pledge worth $#{pledge.amount}."
      puts "#{@name}'s pledges: #{@pledges_received}"
    end

    def each_received_pledge
      @pledges_received.each do |name, amount|
        yield Pledge.new(name, amount)
      end
    end

    def total_pledges
      @pledges_received.values.reduce(0, :+)
    end
  end
end
