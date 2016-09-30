module CrowdFund
  Pledge = Struct.new(:name, :amount)

  module PledgePool
    PLEDGES = [
      Pledge.new(:bronze, 50),
      Pledge.new(:silver, 75),
      Pledge.new(:gold, 100)
    ]

    def self.random
      PLEDGES.sample
    end
  end
end
