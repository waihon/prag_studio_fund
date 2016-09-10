class Project
  attr_accessor :name
  attr_reader :funding, :target_funding

  def initialize(name, target_funding, funding=0)
    @name = name
    @target_funding = target_funding
    @funding = funding    
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
end
