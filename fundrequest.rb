require_relative 'die'
require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_pool'
require 'csv'

class FundRequest
  attr_reader name

  def initialize(name)
    @name = name
    @projects = []
  end

  def add_project(project)
    @projects << project
  end

  def request_funding(rounds)
    puts "There are #{@projects.size} projects in #{@name}:"
    @projects.each do |project|
      puts project.name
    end

    pledges = PledgePool::PLEDGES
    puts "\nThere are #{pledges.size} possible pledge amounts:"
    pledges.each do |pledge|
      puts "A #{pledge.name} pledge is worth $#{pledge.amount}"
    end

    1.upto(rounds) do |n|
      puts "\nRound #{n}:"
      @projects.each do |project|
        FundingRound.take_turn(project)
      end
    end
  end

  def print_stats
    @projects.each do |project|
      puts "\n#{project.name}'s pledges:"
      project.each_received_pledge do |pledge|
        puts "$#{pledge.amount} in #{pledge.name} pledges"
      end
      puts "$#{project.total_pledges} in total pledges"
    end

    #fully_funded, under_funded = @projects.partition { |project| project.fully_funded? }

    puts "\n#{@name} Statistics:"

    print_fully_funded_projects

    print_under_funded_projects
  end

  def load_projects(from_file)
    CSV.foreach(from_file) do |row|
      # funding (3rd attribute) is optional
      if row[2].nil?
        project = Project.new(row[0], row[1].to_i)
      else
        project = Project.new(row[0], row[1].to_i, row[2].to_i)
      end
      add_project(project)
    end
  end

  def fully_funded_projects
    @projects.select { |project| project.fully_funded? }
  end

  def under_funded_projects
    @projects.reject { |project| project.fully_funded? }
  end

  def save_projects(to_file="projects.txt")
    File.open(to_file, "w") do |file|
      print_under_funded_projects(file)
    end
  end

  private

    def print_fully_funded_projects(file=$stdout)
      prefix = "\n" if file == $stdout
      file.puts "#{prefix}#{fully_funded_projects.size} fully-funded projects:"
      fully_funded_projects.each do |project|
        print_name_and_funding(project, file)
      end
    end

    def print_under_funded_projects(file=$stdout)
      prefix = "\n" if file == $stdout
      file.puts "#{prefix}#{under_funded_projects.size} under-funded projects:"
      under_funded_projects.sort.each do |project|
        print_name_and_funding(project, file)
      end
    end

    def print_name_and_funding(project, file=$stdout)
      file.puts "#{project.name} (#{project.funding_needed})"
    end

end
