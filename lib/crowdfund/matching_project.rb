require_relative 'project'

module CrowdFund
  class MatchingProject < Project
    def add_fund(amount=25)
      amount = (amount * 2) if secured_half_funding?
      super(amount)
    end

    def half_funding
      @target_funding / 2.0
    end

    def secured_half_funding?
      @funding >= half_funding
    end

  end
end
