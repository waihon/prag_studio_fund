def project_info(name, funding=1000)
  "#{name} has $#{funding} in funding."
end

project1 = "Project ABC"
puts project_info(project1)

project2 = "Project LMN"
funding2 = 2500
puts project_info(project2, funding2)

project3 = "Project XYZ"
funding3 = 3800
puts project_info(project3, funding3)

puts "Projects:\n\t#{project1}\n\t#{project2}\n\t#{project3}"
