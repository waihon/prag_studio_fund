class FundRequest
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
