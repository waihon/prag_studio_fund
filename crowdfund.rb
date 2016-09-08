class Project
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
    "#{@name} has $#{@funding} in funding towards a goal of $#{@target_funding}."
  end
end

def project_info(name, funding=1000)
  "#{name} has $#{funding} in funding."
end

project1 = Project.new("Project LMN", 500, 3000)
puts project1

project2 = Project.new("Project XYZ", 25, 75)
puts project2

project1.remove_fund
project2.add_fund
puts project1
puts project2