class Project
  attr_accessor :name
  attr_reader :funding, :target_funding

  def initialize(name, target_funding, funding=0)
    @name = name
    @target_funding = target_funding
    @funding = funding    
    @pledges_received = Hash.new(0)
  end

  def add_fund(funding=25)
    @funding += funding
    puts "#{@name} got more funds!"
  end

  def remove_fund(funding=15)
    @funding -= funding
    puts "#{@name} lost some funds!"
  end

  def to_s
    "#{@name} has $#{@funding} in funding towards a goal of $#{@target_funding}, i.e. $#{funding_needed} is still needed."
  end

  def funding_needed
    @target_funding - @funding
  end

  def fully_funded?
    funding_needed <= 0
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

end
