project1 = "Project ABC"
funding1 = 1000
puts "#{project1} has $#{funding1} in funding."

project2 = "Project LMN"
funding2 = 2500
puts " #{project2}: $#{funding2} ".center(50, "*")

project3 = "Project XYZ"
funding3 = 3800
puts "#{project3.ljust(50, ".")} $#{funding3}"



puts "Projects:\n\t#{project1}\n\t#{project2}\n\t#{project3}"
