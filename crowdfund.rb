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

class FundingProgram
  attr_reader name

  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def request_funding
    puts "There are #{@projects.size} projects in #{@name}:"
    @projects.each do |project|
      puts project.name
      puts project.target_funding
      project.remove_fund
      project.add_fund
      project.add_fund
      puts project
    end
  end
end

project1 = Project.new("Project LMN", 500, 3000)
project2 = Project.new("Project XYZ", 25, 75)
project3 = Project.new("Project SAAS", 100, 5000)

vc_friendly = FundingProgram.new("VC-Friendly Start-up Projects")
vc_friendly.add_project(project1)
vc_friendly.add_project(project2)
vc_friendly.add_project(project3)
vc_friendly.request_funding