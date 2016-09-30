module CrowdFund
  module Fundable
    def add_fund(amount=25)
      self.funding += amount
      puts "\n#{name} got more funds!"
    end

    def remove_fund(amount=15)
      self.funding -= amount
      puts "\n#{name} lost some funds!"
    end

    def funding_needed
      target_funding - funding
    end

    def fully_funded?
      funding_needed <= 0
    end
  end
end
