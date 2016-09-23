require_relative 'die'
require_relative 'project'
require_relative 'funding_round'
require_relative 'pledge_pool'

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

    fully_funded, under_funded = @projects.partition { |project| project.fully_funded? }

    puts "\n#{@name} Statistics:"

    puts "\n#{fully_funded.size} fully-funded projects:"
    fully_funded.each do |project|
      print_name_and_funding(project)
    end

    puts "\n#{under_funded.size} under-funded projects:"
    under_funded.sort.each do |project|
      print_name_and_funding(project)
    end
  end

  private

    def print_name_and_funding(project)
      puts "#{project.name} (#{project.funding_needed})"
    end
end
