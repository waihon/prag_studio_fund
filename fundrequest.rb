require_relative 'die'
require_relative 'project'

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
      die = Die.new
      if die.roll.even?
        project.add_fund
      else
        project.remove_fund
      end
      puts project
    end
  end
end
