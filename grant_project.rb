require_relative 'project'

class GrantProject < Project
  # Grant project doses not allow funds to be removed
  def remove_fund(amount=15)
    @funding -= 0
    puts "#{@name} retained same funds!"
  end
end