class Project
  attr_accessor :name
  attr_reader :funding, :target_funding

  def initialize(name, funding, target_funding)
    @name = name
    @funding = funding
    @target_funding = target_funding
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

project1 = Project.new("Project LMN", 500, 3000)
puts project1
project1.name = "Project PQR"
puts project1.name

project2 = Project.new("Project XYZ", 25, 75)
puts project2

project1.remove_fund
project2.add_fund
puts project1
puts project2